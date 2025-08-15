# Research Workflow

## Research Hierarchy (ALWAYS check in this order):
1. **Serena memories first** - Check `list_memories` for existing knowledge (costs 0 tokens)
2. **Context7 for libraries** - Use for any known library/framework documentation
3. **FireCrawl for web** - Use ONLY after checking memories and Context7

## Web Search & Scraping Rules
- **NEVER** use WebSearch or WebFetch when FireCrawl is available
- **ALWAYS** use `firecrawl_search` instead of WebSearch (returns content, not just links)
- **ALWAYS** add these parameters to FireCrawl calls:
  - `maxAge: 3600000` - Enable caching for 500% speed boost
  - `formats: ["markdown"]` - Reduce token usage
  - `onlyMainContent: true` - Skip navigation/ads/footers

## Context7 Documentation Rules
- **ALWAYS** call `resolve-library-id` first to get Context7-compatible ID
- **Token limits**: Use `tokens: 3000` for quick reference, `10000` only for deep dives

## FireCrawl Tool Selection Guide
- `firecrawl_scrape` - Single known URL (fastest with maxAge caching)
- `firecrawl_map` - Discover URLs on a site before scraping
- `firecrawl_search` - Find info across multiple sites (USE THIS instead of WebSearch)
- `firecrawl_batch_scrape` - Multiple known URLs
- `firecrawl_deep_research` - Complex multi-source analysis (last resort, expensive)
- `firecrawl_extract` - Structured data extraction with schema