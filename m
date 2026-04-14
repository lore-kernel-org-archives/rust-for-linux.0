Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8D7377EC3
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176218; cv=none; b=aaGPnz9fWb24M1XPQZ/sWpbK5GQnyFBDUbDKLL9F8SM0pKNwn1BT3Hh8QvxEBKKAnSnl50wYByRF3hik29ARUEHMCL4d3QbHuLHy+rfewY3r2IZZ9Gfcs83atikyMDgBRnYJEHLIOoRqYewXbGbGZe2/FdxpB08hnx56ps3QmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176218; c=relaxed/simple;
	bh=HK0VkgrMjT9M+SKZuCcEdJVW/09Re+Jky0jpwkhuOFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6GnmDZZZvBKE9p91syp2M1oDY3/ILdMg8jzj8hj+kpala/4qFRag5asJJtkkh3zJPjkF73ughDz3fgRlWFl4MonPSmyta8A47yyJovaArXjVhho9cULwOuJ3LGoBBjFZW8iclRQKMspMSI45P5h+VijeV8rz2UOlxR/ghRpUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh1Qe33k; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh1Qe33k"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c62fc8debso876772666b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776176215; x=1776781015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTGo+ZcE+Hh2IH1ZVYC1AB7M8Q8skYrTWtzq6eChQ9c=;
        b=Kh1Qe33kstikxHnWiUBLBZTOmvQrj5C8Mc0ELhL07iufKdSE2vsrLNjcaqi7PSpOmj
         rNE23LVfVMFbtyR+fi6NR8dMcczP7jMCu5nlOGUttImoaYl6grumgWoTMfo/ahA/SEZJ
         sL02qGjnQiBrwRaHsnHGYPT+V+8ACDVPF7+k9M+FrF0XwJ8I6TaXjxjURmG6ll/w0mIV
         7/3EcoCfcYMBAesIEU9UK9MGVkSjHHO3Db9qUz9A/0T+DJdBVnBq4o5y/0qI5eWeqjNK
         8V1OWU9LoYNUVRs/jFkXcGl6uaTvy1sTQjnjblIF/TzhXmbEFpOaVg3o5pJuNtuAYpfV
         4f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176215; x=1776781015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTGo+ZcE+Hh2IH1ZVYC1AB7M8Q8skYrTWtzq6eChQ9c=;
        b=chDGVmKjkM0TE9u4/2gOEy9HpXfjP8B71seSNn7eHHfAUJBG9AtW9hjQTvIrpC/NYL
         6Oa2ZHTrTQ5jtTg8rz17d3FJyeUiv+pfF7N6t5rmD5PH016nsjWShOaA/9RZwuWIApKq
         suj0NzMgwM1/J2Pii8sBloHv05dGL40B0DKSK00egX5mQrtRcwSZ14a+6R3TjHu7bqoA
         DbbkOM7Nlar7+WWb3RAaMmvgD0ZTsqUF+9C6ZGEoo2Oje33+G8oCU9vsEwZTfkENkCTz
         nUPvhaKU62k0WlWRyROi86/PFi9QLTJpBy6htrdxfh94qUWbZExp6SGqRDxtQpo+9SdA
         ixJw==
X-Forwarded-Encrypted: i=1; AFNElJ9BZ6QKlCuOoxnwBhd1N7Tw9TVDI3UfvUAs47xdWtFx2pAYMt4Iq9a9PxrSlQU+4b2SpxvQD93vVq0c0dK7+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhw1P+KmtNysnfChMiQe4caCyX9kHdv9rA1E2NgkT/ycam6eJA
	LT16sZHxAQWc+QJwUUkUItYlihkrgOtnvnt1hC5PK6XAf7PhDQMlLf7C
X-Gm-Gg: AeBDieuIpET+8KPh04mq8BHawbSpUOl7MR8l5halCsgyV9Uhw3ncRzqcrxoilRbZYwj
	vtP5CV0PKOm6LvxpMfjBfLhlZ5jOsuQSx9mRK8SYaRgPkE4W6PYxqKVCG8JgWon9t6m+Et1J0x2
	qw5rwbQQCIGthvx1rbwbGfTtI0lH/NLUFgcVNDM/zpQI4x0QsS98u6RkdgV73YlUBlqemyHOut5
	uTUtNIGkcwosoyiOo9IjPi0GdPf76esbgF1dJmK9CynKf1wgzi4wIfjDfysm24FC2Xum2zUViVE
	fGWeJli2fQO5hIHynKjDfw5jjn6JJPObu67e8s1ww1ST58e9zutNn5mdqKganWOxID7QnpzmD4C
	KaMfOuwP/Z2B2xBy3Y2mO7EL5wi4aSkbFGSJtuTG9FfODnzekBmt0XGfZcpAX3QOMxCdWQ0+7JS
	aVINp81AXYWNH5TSgAD1tz9YKo2VIh341FKLLpL1NLUq6pwtbqAvoQBh0C+fJcIw9hFaEtabK49
	+v6qn68hJ/QX2CdeR1Cv0phA2MJhpWFnQt9VBEGxCvYGu4X
X-Received: by 2002:a17:907:8b8b:b0:b9c:9594:e00 with SMTP id a640c23a62f3a-b9d7277caebmr981980566b.1.1776176214831;
        Tue, 14 Apr 2026 07:16:54 -0700 (PDT)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-084-056-106-044.084.056.pools.vodafone-ip.de. [84.56.106.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8492sm409080366b.47.2026.04.14.07.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:16:53 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:16:51 +0200
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, miguel.ojeda.sandonis@gmail.com, 
	a.hindborg@kernel.org, acme@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1] perf test type profiling: Remote typedef on struct
Message-ID: <i5kj32dvbvubv4ozn2gzbzo55o6sm753l34psc7j6fraa3g4g6@r5lcpwdgkgr3>
References: <jiwt5mjma2puv7kjbgploxx2l5tankjm4zu2tsa75qkckwnwjk@f7mz5vlvzpjz>
 <20260302235821.588686-1-irogers@google.com>
 <gfdliffsgy4j6q2vrilr6kapy3hczh4udszy4wcba6aal3ado4@hfeqa2eizu5y>
 <kr2bfp43sqatdssmhzpmogs2h27ddbmegvaknxb6by24n2t64h@hv4m5myvswpa>
 <acts0fXgsuirBp9G@google.com>
 <wqmqx6rnqrociriliyojihkxi3llractltkfcwznzu2g5gbieb@y7eaaiee5x2o>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wqmqx6rnqrociriliyojihkxi3llractltkfcwznzu2g5gbieb@y7eaaiee5x2o>

> On Tue, Mar 31, 2026 at 09:22:31PM +0200, Dmitry Dolgov wrote:
> > On Mon, Mar 30, 2026 at 11:42:25PM -0700, Namhyung Kim wrote:
> >
> > We have this:
> > 
> >   Dwarf_Die *die_get_real_type(Dwarf_Die *vr_die, Dwarf_Die *die_mem)
> >   {
> >       do {
> >           vr_die = __die_get_real_type(vr_die, die_mem);
> >       } while (vr_die && dwarf_tag(vr_die) == DW_TAG_typedef);
> >  
> >       return vr_die;
> >   }
> 
> Indeed, I didn't finish the analysis, fooled that the diff was solving
> the issue. Adding DW_TAG_typedef into __die_get_real_type still fixes
> the problem, but due to different reasons:
> 
> * check_variable calls __die_get_real_type directly at the beginning and
>   stores the result in type_die, which is the result of the function.
> 
> * if it doesn't resolve DW_TAG_typedef, the flow goes into the
>   die_get_real_type, which stores the result in the local variable
>   sized_type. But it never copied into the type_die, and never returned
>   as a result of the check_variable.
> 
> Hence we either need to add DW_TAG_typedef into __die_get_real_type, or
> copy sized_type into type_die. After some testing both seems to be
> achieving the goal.

Any thoughts on this ^ ?
