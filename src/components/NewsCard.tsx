interface NewsCardProps {
  slug: string;
  title: string;
  date: Date;
  description: string;
}

export default function NewsCard({ slug, title, date, description }: NewsCardProps) {
  const formattedDate = date.toLocaleDateString('ja-JP', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  });

  return (
    <article className="group p-6 rounded-2xl bg-white border border-gray-200 hover-card shadow-sm">
      <a href={`/news/${slug}`} className="block">
        <div className="flex items-center gap-3 mb-4">
          <time className="text-sm text-gray-500 font-medium">{formattedDate}</time>
        </div>

        <h2 className="text-lg font-bold text-gray-900 group-hover:text-gray-600 transition-colors duration-200 mb-3 line-clamp-2">
          {title}
        </h2>

        <p className="text-gray-500 text-sm leading-relaxed line-clamp-2 mb-4">
          {description}
        </p>

        <div className="flex items-center gap-2 text-gray-400 group-hover:text-gray-900 transition-colors text-sm">
          <span>続きを読む</span>
          <svg
            className="w-4 h-4 group-hover:translate-x-1 transition-transform"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M9 5l7 7-7 7"
            />
          </svg>
        </div>
      </a>
    </article>
  );
}
