Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B92367D9
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801139; cv=none; b=Lzke8aWhba5eSTh3vJdD9gs4H4ChdwLs4jRTnbVdHVmz9HRPtOW4TgAvWVGlJ9rgGXWxZvF4bDWzsqiOQ9WaecCPp6dN1twmDnO6LI3HWSsFt/hCaKtUVDly3XoKgd+DMP2qYUb03OHJT7y4LZB8gssbZW4CU5mgi1NB7ludTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801139; c=relaxed/simple;
	bh=DDR7/biQEivv2qc3sw/5wMa3uZ0Vf/JSwjwbNIat75Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0Sorq4SOejNk4aYb3BuVH4gNipJTCKG6rH5mXlUuN+kKi4bOEIa9tDRbiR9p3XHVPWtMNEZ01lp1jWtw8HpW9XFeyogQrrYAwmkbncCWYfwiKSdBUoVY5iQQGctUGssD1RJLyEtv0GUY+fTgb/jCXlfVCnEpQcKAe3h/1TZAmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZ5V2HTj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZ5V2HTj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66beb21f3ffso394298a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801136; x=1775405936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5I3lcqeRKGWbcd+bgTXszKr0+49iSlVC1ea8hfMMr1o=;
        b=FZ5V2HTjoAKAxshy/rJUldruzsqFZnYIlKxi6A/5iZ4mNXn15pLdnM9SZvAmCYZB80
         y5Bkeph7Kd6tIBCJbnWDILJtZ8ukXHpUn9WZx9LclBSzXO8bwLvhKXAyXC3pBJlXfRkC
         lXiNHj4c/DnIHb6heOCpAfn9GGhDmtMxD33xWJVqgZDUr26a/st2ibTGoBCzl2OalNkW
         TQTFRU7ze8aDx0ItHAMrWEe2tBA/ED4yV0vTwFDyu5XBZBuelfsg6EY8W32RRwhAIO0D
         jtuc3Gf1w+jGCDSN0AVOAnwgML4sO7N8C3eAPLmn+zQXHAb78kwnrim6chvCZjv6ob8s
         wG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801136; x=1775405936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5I3lcqeRKGWbcd+bgTXszKr0+49iSlVC1ea8hfMMr1o=;
        b=YCZB/rsD/dBiMDxKa/SKCYNYE7RMk4Ri3eJzQjTMnmpSNo+irvs3Jye60iU+xn66or
         1FKjs2hLDd5D4uAU1l9ED+SHoeQs3h9uA/LrzDK7xFNJ1hqtKrxmrQO/ldDorLWVG3+w
         P9LWPJ5gtz6u5AJEjeH2HLiIaWOcwUggNPBs1WUSLrVoLXlb3VtGvvpOU/Ymc53qdnJo
         us6T2HP4855HG72zK/jY5a/g+hWJVUf1hQLbJ3zWunaCD1d79xzQmW4zsGEBZUYbS3uf
         QN/nGbsKlQBhYVXewQA3R3xl8brJp9KyAgHde1kjvbA2zhIQiGsHUkx3qR1pZPfqlA1L
         Hq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCULE/k8fDq6sGeNLWZ68Bi+TgPICxemdg8T+JoKGxeb2dCQ7OnhULl+Nd006DBr4g27nbCHpT3Pj9AGucYMgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO5TpgXOkMyQrxnkXXE+0798ga5RKAD7eTbdzJdOEGoUsnof6G
	EORQ6346msTT75ZBfIM+7yxnFSa03BO/cZ5AZFc66k5ezT3a0xpT4UnC
X-Gm-Gg: ATEYQzwvtqByic0LuQ8V1D3UyPDme2m/tcB8wZwmrod3kRKyv6qUMOicP9t+UOxpvCp
	s4sM0bmGyl51dLqNAUXwambUjrVIqI/bap8Ti0LNVGrJQSeqD/26IlTQEIMSq/NZsS1UOKTu6d+
	KWV4ctRxSsKkQHwgoeuyX9kod70Ol7nt9UHNogTVO6hCo2CMHoKmgN7axL552A1DDOiFYBC/FKK
	p/huTJx8XzrZf+VJMZLIfMH5i7wRla+JF4bSVrcULbpBevOo3bjtp1c1goyQqa0A0t7v7Ha7XOK
	qwFF2Solo8TDL3UTXrGE/M0SVYa5I0p6u0p6ss24IuYWT5WNFekYbCkY7QxVZ0He/RW9A9opojs
	feOBpWhecHc2EQt0+XSNPSHOKkh2Eabl1VHdT3GsOStMMcTILWOcJm9CqCJe2CV8djuswAQN1M9
	w5EGuBqS2Yyk+eIcllYCx5svcH2wYQBINBLuGOHQWMB8R86UzZyaRhxQLjBzV1YvnT084aKc/HB
	NG9z+ywenJWtr+EQQqeYFkJPcbxfKi2iu6ryA==
X-Received: by 2002:a17:907:3e07:b0:b98:2888:6ee9 with SMTP id a640c23a62f3a-b9b507968c5mr599562766b.40.1774801135869;
        Sun, 29 Mar 2026 09:18:55 -0700 (PDT)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-084-056-106-044.084.056.pools.vodafone-ip.de. [84.56.106.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5924sm180808566b.32.2026.03.29.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:18:55 -0700 (PDT)
Date: Sun, 29 Mar 2026 18:18:52 +0200
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org, 
	acme@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, lossin@kernel.org, namhyung@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1] perf test type profiling: Remote typedef on struct
Message-ID: <kr2bfp43sqatdssmhzpmogs2h27ddbmegvaknxb6by24n2t64h@hv4m5myvswpa>
References: <jiwt5mjma2puv7kjbgploxx2l5tankjm4zu2tsa75qkckwnwjk@f7mz5vlvzpjz>
 <20260302235821.588686-1-irogers@google.com>
 <gfdliffsgy4j6q2vrilr6kapy3hczh4udszy4wcba6aal3ado4@hfeqa2eizu5y>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gfdliffsgy4j6q2vrilr6kapy3hczh4udszy4wcba6aal3ado4@hfeqa2eizu5y>

> On Wed, Mar 04, 2026 at 11:44:16AM +0100, Dmitry Dolgov wrote:
> > On Mon, Mar 02, 2026 at 03:58:21PM -0800, Ian Rogers wrote:
> > The typedef creates an issue where the struct or the typedef may
> > appear in the output and cause the "perf data type profiling tests" to
> > fail. Let's remove the typedef to keep the test passing.
> 
> Yes, makes sense to me, thanks. As mentioned in the previous message, it
> sounds fishy to me that perf record and perf mem record capture
> different data type -- I'll try to get to the bottom of it.

I think I figured it out. To reiterate, the problem was that in my environment
this:

    $ perf record ...
    $ perf annotate --code-with-type ...

was showing a different data structure for workload_datasym_buf1 (buf vs struct
_buf) than:

    $ perf mem record ...
    $ perf annotate --code-with-type ...

It turns out that the type_die for this variable was derived differently: for
"record" it was going through check_variable, for "mem record" through
global_var__collect. If the type tag is DW_TAG_typedef, check_variable tries to
figure out a real data type via die_get_real_type, which says this:

    /**
     * [...]
     * If the type is qualifiers (e.g. const) or typedef, this skips it
     * and tries to find real type (structure or basic types, e.g. int).
     */

But the underlying implementation doesn't actually check for DW_TAG_typedef for
some reason:

	while (tag == DW_TAG_const_type ||
		 tag == DW_TAG_restrict_type ||
		 tag == DW_TAG_volatile_type ||
		 tag == DW_TAG_shared_type);

By itself it doesn't look problematic, but for some reason datasym test was
producing such a code, that had a chain of two DW_TAG_typedef in a row, so that
die_get_real_type was returning a DW_TAG_typedef again.

It looks to me like a deficiency of die_get_real_type, and the following code
change fixes the problem for me:

diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
index 9267af204c7..de152fae1d9 100644
--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -279,6 +279,7 @@ Dwarf_Die *__die_get_real_type(Dwarf_Die *vr_die, Dwarf_Die *die_mem)
        } while (tag == DW_TAG_const_type ||
                 tag == DW_TAG_restrict_type ||
                 tag == DW_TAG_volatile_type ||
+                tag == DW_TAG_typedef ||
                 tag == DW_TAG_shared_type);

        return vr_die;

Does this change sound reasonable?
