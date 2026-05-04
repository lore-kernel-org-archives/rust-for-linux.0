Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B2833E37A;
	Mon,  4 May 2026 21:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929173; cv=none; b=HEE1Msa0pnv7M/3OIMGzA2ZfdFrn2lg+YBtXoNHfyG5OflTLZiKaKtoa10hm/88fMDx07Z1S/DAyfH3UDqB25dzPd+CWuTHsnhWYs+ZnPBlm1Bn1os0rp8zGHIg/tGQNZ8xJ2BcC59WDcrjgcwOddCJgghDyrgkHrCuJziw4NU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929173; c=relaxed/simple;
	bh=ZnCZdNCxn8npZMyFM0pYMHISRo9M2Zkp8ban2mYLgBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHk+zmnB4bRChzGjDv3y2tepyQ45qoO7ShqwO5e1m2z/ugEhZpzvaaIZaR4TIgcqRlhBWtA6QzlJlfUeenBaRicubMW+E283ecE7CYghiSISVkqV50/UNuIA5Gw3pdpau+vfgdWYCNBRVAqZKKM/LHiZTn0ycIc1Q6to0fq3diQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JHUg/lmp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JHUg/lmp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=GOrq0FmYt146KEaP/0t4BYZ0xBPV0kAcPymJqneOxKo=; b=JHUg/lmpW2KLHT8BgUHig7rROO
	xoYGXTSWML71aM3J2qlHFE129ZsUmvUw8T/w5JhYaSaYMygSJh/wVa/5yGfjTV2Q/VRE6uIe/b8q/
	Rv19tZRqpE0RsWMJwUsl8v6jkl77aekrysRQAQ8WZCOW/8ubs8tKbTBn7sgmdP+V2uaG9xNtymqaq
	jHSYU+guSOARCa3Qq609r9VlTVxTVIizHW/+OqsmDWLVVMEFdCQYw4BhG2eGO4YdcTFICfxH7wT/N
	z7P7SMROolMnNvW7GVeYMnianSodHvBiHmPf/IEy3N8D72eGjuRU6okFZI6KLNqXG09tHi+goEnw0
	Dvht3fMQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0aw-0000000EKeK-2hYt;
	Mon, 04 May 2026 21:12:50 +0000
Message-ID: <afcc4dc7-14c8-4a10-aea4-69ae7ed3f37f@infradead.org>
Date: Mon, 4 May 2026 14:12:50 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] docs: maintainers: add a filtering javascript
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <854faf4127053c203cae479f68e6ac12a4e4aabc.1777908711.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <854faf4127053c203cae479f68e6ac12a4e4aabc.1777908711.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/4/26 8:51 AM, Mauro Carvalho Chehab wrote:
> The maintainers table is big. Add a javascript to allow filtering
> it. Such script is only added at the page which contains the
> maintainers-include tag.
> 
> I opted to keep the search case-sensitive, as, this way,
> upper case searches at subsystem.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/maintainers_include.py | 77 +++++++++++++++++++--
>  1 file changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
> index bbdadf2aa4f3..f85298627da2 100755
> --- a/Documentation/sphinx/maintainers_include.py
> +++ b/Documentation/sphinx/maintainers_include.py

> +  function addInput() {
> +    const table = document.getElementById("maintainers-table");
> +    if (!table) return;
> +    let input = document.getElementById("filter-table");
> +    if (!input) {
> +      const filt_div = document.createElement('div');
> +      filt_div.innerHTML = `
> +        <p>Filter:
> +          <input type="search" id="filter-table" placeholder="subsystem or property (case-sensitive)" />

The "placeholder" string does not fit inside the prompt/entry block so it is
truncated with no way to tell what the missing part is AFAICT.
Maybe include that after "Filter:"? E.g.,

           <p>Filter: (subsystem or property, case-sensitive)

> +        </p>
> +      `;


-- 
~Randy

