Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1C30149F;
	Mon,  4 May 2026 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929631; cv=none; b=JUq7SvgnT4NCUlYUY60CjN1UIE1CGCGVkHcVfpuHw4xvaPGo1r5U+Y6iQQ+lm5FXq7KdrNzKEfD4sLyacGBfJVW1H3XEQy/3gtHzIFupWqOvb1XKT28VzsF/xm8T8VsMjIqT082zBCiynohlPP7yu4hg/6tRNXK303OCcUMSdIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929631; c=relaxed/simple;
	bh=q2hU5EN/YVzz5oiGVB7pd2sXphmD2t8z5mL/yMYDOdE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V4Ek6ahIZ3a18mF5rpNjXBJ4Xt1I57m9A0WWNb0NWplEbdp+QL41kfMihI0j6xNzE2wQ832ipgfKJ4u4lNbU0PQeIQlbrtrC5uR2xCI4k1wmlcD6O4fVo4i4JzlN4ZySi9gDubsZNGd2U3dNkQlHRfZZiK9+JCEZUTv4B9VjpRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZqC0Ykun; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZqC0Ykun"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7sknApjmcBBoJxEdDVHBhLk6jNzUcgTGcDkQ0F/rCao=; b=ZqC0Ykun81iAuhjjtc692tzCLP
	+wkcTISHVLw3BLBW1p/KrIHi1VN7C5PQ7qsT3C4f9lwbpEIOl30Mo7Tq9OGYl6rd957Ua6WtRSVz+
	areoEcKTAmI7QBRnhxYexKFrSYOTrVaROPrjH/MSN/WgVEC6m4m7m0GhG5QV/kvBxoIGwzrFub3SN
	oFnZuikiUrP/OQ3OVAwDHZl+gKCNQ4qGAtxEYAJ/LO0Y8qmgVS1g7aGNLVdJyKdsmAZOV99ld9FZz
	/kiGH8Q4xQv/YQqU8zw1uke7QKYi4pHKWochytoE0ZagWxcxAr02nnd4GXUJjWSlOhe8yscIvaF6p
	yQhgU/Bg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0iK-0000000ENDY-3AoI;
	Mon, 04 May 2026 21:20:28 +0000
Message-ID: <c2efc1a7-4406-4590-b863-5f258f3cae50@infradead.org>
Date: Mon, 4 May 2026 14:20:28 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 2/9] docs: escape ** glob pattern in MAINTAINERS
 descriptions
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>,
 Matteo Croce <technoboy85@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Matteo Croce <teknoraver@meta.com>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <31f673089e2a83dc1fee17d47784579874476ca5.1777908711.git.mchehab+huawei@kernel.org>
Content-Language: en-US
In-Reply-To: <31f673089e2a83dc1fee17d47784579874476ca5.1777908711.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/4/26 8:51 AM, Mauro Carvalho Chehab wrote:
> From: Matteo Croce <teknoraver@meta.com>
> 
> Escape '**' in the MAINTAINERS descriptions section to prevent
> reStructuredText from interpreting it as bold/strong inline markup,
> which causes a warning when running 'make htmldocs'.
> 
> Fixes: 420849332f9f ("get_maintainer: add ** glob pattern support")
> Signed-off-by: Matteo Croce <teknoraver@meta.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/maintainers_include.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
> index c7f9911ae45b..e679acf0633d 100755
> --- a/Documentation/sphinx/maintainers_include.py
> +++ b/Documentation/sphinx/maintainers_include.py
> @@ -127,7 +127,8 @@ class MaintainersParser:
>              output = None
>              if descriptions:
>                  # Escape the escapes in preformatted text.
> -                output = "| %s" % (line.replace("\\", "\\\\"))
> +                output = "| %s" % (line.replace("\\", "\\\\")
> +                                        .replace("**", "\\**"))
>                  # Look for and record field letter to field name mappings:
>                  #   R: Designated *reviewer*: FullName <address@domain>
>                  m = re.search(r"\s(\S):\s", line)

These comments still apply from my review of this patch on 4/9/26:

It's nice to eliminate one warning from 'make htmldocs', so this is good
in that regard. However, there are still multiple problems (not Warnings)
with '*' characters in the MAINTAINERS file:

1) 	   F:	*/net/*		all files in "any top level directory"/net

In the html output, it shows "/net/" italicized (that's what one * does).

2)	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs

In the html output, it shows

	F: fs/**/foo.c all foo.c files in any subdirectory of fs

with both occurrences of "foo.c" italicized (dropping the '*' characters).

These 2 examples are actively wrong.

[adding new:]
We would be better served by just putting file patterns inside ``fs/**/*foo*.c``
quotation marks IMO.

Ah, similar to what you do in the table output.

Oh, with one little glitch:
E.g., in the very first entry for 3C59X NETWORK DRIVER,
  F:	Documentation/networking/device_drivers/ethernet/3com/vortex.rst
  F:	drivers/net/ethernet/3com/3c59x.c
it looks like automarkup is applied to the Documentation file so these
2 files are displayed as:

networking/device_drivers/ethernet/3com/vortex, drivers/net/ethernet/3com/3c59x.c

with the Doc file underlined and missing both Documentation and .rst.
Or maybe that's what you intended since the automarkup link does work.
It's just not what I expected. Oh well.


-- 
~Randy

