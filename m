Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E10205AAF
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Dec 2024 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355539; cv=none; b=qJrx7fMxRpEvrRafhU32JLIvPQPohB3O2DJZGzpGfF8uw0orTaL9aSsR+qX6Rw80PjMBuu/RgJpoVCsWPB6cizwnUb+NrLv4sAVYTdPsGBkJyTQyM4CvciY4k8AiB0JrLGb/v/kei0smQ7Z2bgJihZxlQiZ8keSxG7496TG4lyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355539; c=relaxed/simple;
	bh=NndeOH6sd65ORicRkF+Jky+H97Q2/FBkQEok6InkZT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ2spYz6mRepW8WzpF08VO5Oe9gS8D3vOgFTI8biaV+cuz1LGyqB6WQ0G8ygpnwbvBMaS1QXqOSrC5QpWENCl4ozl74okxA2oHV38FDZS3aoh9+RJwy78SbfXtVS5gZLc0+ObAeC5RI2BYcYpATBlWLfVEzwmO8ikg7B2R7LNuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EUpcv9Jh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EUpcv9Jh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4449273f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Dec 2024 05:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734355536; x=1734960336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
        b=EUpcv9JhDG+2+g4LGiJBH1hjfimm5Q0kzVNJbo3NAy1yLnwroXqbQ0NS/QZp5EYQVV
         /5ImGO+ypVik5s8CR5Vcas9g9zsw8KiGgkktNCkfbrVT30JlWJRm9JScQfidsojKDP6F
         LyqMVkm8eXmX87BJzpX5OFKwwtXff544hFQJS57sNf3lS6PQqdZwViSyNgKWRHDwq0ZR
         MLC0oapa2oLutHV2lmPGbmwHMklOpIvP2sXkAK1dLPzoPodLhxemY1HBI/g7W0KhqPCM
         HAJtOW1vcBxejpgdrTVniY212gDzGYMNv5gNiB1JYwHGtNVuSIMr1GVxc/Gvq8XdaJiP
         /rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355536; x=1734960336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
        b=TkKyRWqWhmC0G3KCUE/ZeiUIQFKXQ8AN1B0PXo9yUX4dpMYIe5h3vlxRQ/LZGCdPIe
         55nq0a9bntAeXRFjv6cRqWbu785zuu3j3h9l73QiiA8ROln2a6je6VJMSKsTxDMY453R
         51HdrpYCc6gNMJLueUSr4MMXRypC6GVqzmSz8VVz1j+qcluYOwlOoocZ+dqeFjH3v2m3
         /9BzYBt5AVH6aZct232jVhZs5TP8aToiqEzuDlGTn9ZC/71b4W7C7ZPeXLwqaShOTTGR
         ihNcQ3muagEddBh9JIC6zeoqbyBfXOdM5w2ajomL2O8L7DFdhDE6KaWIceXMis5yj7QQ
         +JrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHcFSTg1b5zV8HdvlABxjSTmDVizCTgBGy8WH94NqdAq74RcuipK/lsYeIq7nxxkZm3WQR51Z2cY6MjBeHFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSxySFFFB4t9w3kpbDaGPkus6dFyCXLJ1sulAob51oEU1K7G3
	Eotw1ytuxgxEi6H8mjpzzNbrVMHphf693XXGUU+Hpg2V2FK085Od5IWEiH0DffA=
X-Gm-Gg: ASbGncuwKgSyDRtFg9m61XBv/43hdwm2S0W8NmXvC7zrAjMdabz4pmdDZPdvrgXmI1C
	i0uD3a8KPZ4+taXc49NvO7efRjvTBPItCTAHPY7kMuzNOlBHD08UGowTpvGjmc7b9noYVuBF8Jb
	xqsNB+/KIWNfo88TnR8OpI9/FrRUXLTN1Vwfo0B+Ye6X0pwUYbpTjGLJ8LgwJkNYimQPlbLxc/+
	I9GHv7TAguJGKEZg7kKrUimuh7z/7gB8XkxrVz50JD9jURK8coSsDakXZCe
X-Google-Smtp-Source: AGHT+IGqoSYH/VA6fKloW87cFzqLGeD30iZmGbWZZas/HuP1gKITI6KUoUpWyXXkXirFAcpa9znGog==
X-Received: by 2002:adf:eec3:0:b0:388:c75d:be97 with SMTP id ffacd0b85a97d-388c75dbeaamr7310161f8f.11.1734355535593;
        Mon, 16 Dec 2024 05:25:35 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804a34fsm8253045f8f.76.2024.12.16.05.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 05:25:35 -0800 (PST)
Message-ID: <e522ec59-6ee6-4c11-8a4f-91a683e6435c@suse.com>
Date: Mon, 16 Dec 2024 14:25:33 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] Documentation/kbuild: Document storage of symbol
 information
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/24 03:42, Matthew Maurer wrote:
> Document where exported and imported symbols are kept, format options,
> and limitations.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  Documentation/kbuild/modules.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..c32e3ed67cd26070f6929f6ad98c4308a1ab71f8 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
>  	1) It lists all exported symbols from vmlinux and all modules.
>  	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
>  
> +Version Information Formats
> +---------------------------
> +
> +	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
> +	sections. Symbol names and namespaces are stored in __kstrtab and
> +	__kstrtabns respectively, using a format similar to the string table
> +	used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs corresponding
> +	to exported symbols will be added to the __kcrctab or __kcrctab_gpl.

The second sentence should be that symbol names and namespaces of
exported symbols are both stored in the __ksymtab_strings section.

> +
> +	If CONFIG_BASIC_MODVERSIONS is enabled (default with
> +	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
> +	CRC stored in the __versions section of the importing module. This
> +	mode only supports symbols of length up to 64 bytes.
> +
> +	If CONFIG_EXTENDED_MODVERSIONS is enabled (required to enable both
> +	CONFIG_MODVERSIONS and CONFIG_RUST at the same time), imported symbols
> +	will have their symbol name recorded in the __version_ext_names
> +	section as a series of concatenated, null-terminated strings. CRCs for
> +	these symbols will be recorded in the __version_ext_crcs section.
> +
>  Symbols and External Modules
>  ----------------------------
>  
> 

-- 
Thanks,
Petr
