Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C89B39FCE
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Mar 2025 18:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458656; cv=none; b=k5vzb9Spagj115X/hRrhLXCLgkHP4epB3/Rhzc2dDmI3QZj9G0pQ7pQKBD1jAJSUOIiF91OgrIbIOfPuVBOkUwS0IRGdmvEppd/dNcQ4Fyck1C6EK91HRipekBefmwEsGu2Lvu7Z/xYGfbfB3dG3VwedXAPLHsf1sTFto7EHMY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458656; c=relaxed/simple;
	bh=uegV6SzNrvzv8Lu72cW1Lqhek1OERJI0RNLRHc22BCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4We+3HzZ/5jooxh7Mpr3MhiZ2ipMkwVkOXF+vZNwnL061ezvLVv6E9eg/6a7+luSj1oZcLjyc1fTYS4vu4K0y4lEeNDLdDHw/hMbF8/r1X9+j5LXdYIFvfQtwzWYHrYVhfWC3OKbj/KecmLq8XftsLMQQAmtSr6H81YOfAHbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=GWLeJhO1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="GWLeJhO1"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac0b6e8d96cso409804666b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Mar 2025 10:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1741458651; x=1742063451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OYzCwEg8iZQ/2MVSbV7YyAM5WpMPKmd4xSEbITKoHKU=;
        b=GWLeJhO1NO+d8aE7JzLMHeqWtMyO/0BdjVaUwc6IwLxWSwGO+3tz1fvIEGaiRDu/LE
         hE/0066M0Viz1V0CErutPwK03NyPWo/Shh1uw3P1maHystIHRz0FtvUpOuO9hZCIycu+
         ZmdXiaixtf0FKPV9FhpHUvqlkIHpw7bUO9mfKexvUSqXWEt6JqYDmrtKyolVvlB8BMa7
         2pH4Bm3PQ6nqTHsZ2ifNG3G6VbMXudjqpwHVc47dY+m8Mm2PPDtGqmuycsdEfRH3ESUD
         B1p0bNBNb+Rzm3ETbFKfA6nq73y/nxqyIKKJq5+NT3VEe7FS3f/AdMmE1hRcj5uxuxlf
         Z40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458651; x=1742063451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYzCwEg8iZQ/2MVSbV7YyAM5WpMPKmd4xSEbITKoHKU=;
        b=wW7F7nOZ4jKwWH01DuV2iqp+t9KT3Lt1kez9my391dKo/ubC6kPTvzPNe0nWprEJI5
         EwS9Gc6qATFjbo+8/xYLqJkyb0jf65mzUaQNbuOXTNJ4NX+OWl0VLl82uB9hPLFgEbrp
         PTEnvrLlarEjsBTSMthZ0wVZpK2SR6+0BBFmOc6ctlMiEmy6b3GIzo65VVTXH+h69wY2
         UbRc5u3nQbf4Z6oDgb0NWI4bgIr/TSOq+DNRUZH3i2KwX6vT+C4UoK7a+jdunh3jD+S0
         9qzcfFGrrGR+od5AmePrnjasQaMjpMvgoIPqC18033VBZR+ZU+1t3Ucsrt5L3xNT+yR/
         D3kg==
X-Gm-Message-State: AOJu0YyEgkLMfPjt3DJaSF5Bb84Nb9lPhDg4YlL1NwfDpQvEy+VRKoOa
	wpLIWEqVfJNFB1ytV27smzwiAvZT9EA2VeUcOYrU3wGbyr/eyVbXSRjq2lMRA+s=
X-Gm-Gg: ASbGncvKcGkl30fGmmmchtOi0caOrZmeqFYrss4dehOYaNRcr6KhzHyFmrgCkxfRzYM
	hw/6AD/sOz723Air1gWzMdsSk0MoL4eXfnq0Kx1w38XRMpt1JWn2r/lkx0yqyveJtnGH8fqfcWO
	xkGU9q6GOjpb9tmX1CRRevuJNYLDY4AYKSmwNoQYDMUjEG01SnxEqEN1PaUo1X/+JjPq2+YBLsg
	kGLl68NhMVJxk8KyRxysIB0mpg56eKJ/23j6wfY7YoWJqBxQBhytUBfRilG3+R3n/zr9jayOz4I
	dni90chEe5oF0iRTp7oHUuwLdFSvlgGgeu5OZxcFx2ksgi7KnSmg1qFpdkjILWupOETwrHib
X-Google-Smtp-Source: AGHT+IFpvqrtMcNxEKdZ9ZCMtzR7eszu134IcdgZnLa27XaORcUskX6N4V3lxdQs799jBVuIH8FSzQ==
X-Received: by 2002:a17:906:68cc:b0:ac2:66ff:878 with SMTP id a640c23a62f3a-ac266ff0c24mr562524366b.50.1741458649864;
        Sat, 08 Mar 2025 10:30:49 -0800 (PST)
Received: from [192.168.1.15] (89-24-188-1.customers.tmcz.cz. [89.24.188.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27bd0ea5asm104546766b.4.2025.03.08.10.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 10:30:49 -0800 (PST)
Message-ID: <d2fe8cfc-df97-4947-bcbc-7d43b5c24ecc@sedlak.dev>
Date: Sat, 8 Mar 2025 19:30:47 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 2/2] checkpatch: check format of Vec<String> in modules
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
 a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 apw@canonical.com, arnd@arndb.de, aswinunni01@gmail.com, axboe@kernel.dk,
 benno.lossin@proton.me, bhelgaas@google.com, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, dwaipayanray1@gmail.com,
 ethan.twardy@gmail.com, fujita.tomonori@gmail.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, joe@perches.com, lukas.bulwahn@gmail.com,
 ojeda@kernel.org, pbonzini@redhat.com, tmgross@umich.edu,
 walmeida@microsoft.com, charmitro@posteo.net
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250307131401.638820-1-trintaeoitogc@gmail.com>
 <20250307131401.638820-3-trintaeoitogc@gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250307131401.638820-3-trintaeoitogc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3/7/25 2:14 PM, Guilherme Giacomo Simoes wrote:
> Implement a check to ensure that the author, firmware, and alias fields
> of the module! macro are properly formatted.
> 
> * If the array contains more than one value, enforce vertical
>    formatting.
> * If the array contains only one value, it may be formatted on a single
>    line
> 
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>   scripts/checkpatch.pl | 67 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7b28ad331742..7c42c1a0ea6b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2775,6 +2775,12 @@ sub process {
>   	$realcnt = 0;
>   	$linenr = 0;
>   	$fixlinenr = -1;
> +
> +	my %array_parse_module;
> +	my $expected_spaces;
> +	my $spaces;
> +	my $herevet_space_add;
> +
>   	foreach my $line (@lines) {
>   		$linenr++;
>   		$fixlinenr++;
> @@ -3567,6 +3573,67 @@ sub process {
>   # ignore non-hunk lines and lines being removed
>   		next if (!$hunk_line || $line =~ /^-/);
>   
> +# check if the field is about author, firmware or alias from module! macro and find malformed arrays
> +		my $inline = 0;
> +		my $key = "";
> +		my $add_line = $line =~ /^\+/;
> +
> +		if ($line =~ /\b(authors|alias|firmware)\s*:\s*\[/) {
> +			$inline = 1;
> +			$array_parse_module{$1} = 1;
> +		}
> +
> +		my @keys = keys %array_parse_module;
> +		if (@keys) {
> +			$key = $keys[0];
> +		}
> +
> +		if (!$expected_spaces && (!$add_line && $key && !$inline)) {
> +			if ($line =~ /^([\t ]+)(\s)/) {
> +				$expected_spaces = $1;
> +			}
> +		}
> +
> +		if ($add_line && $key) {
> +			my $herevet = "$here\n" . cat_vet($rawline) . "\n";
> +
> +			my $counter = () = $line =~ /"/g;
> +			my $more_than_one = $counter > 2;
> +			if ($more_than_one) {
> +				WARN("ARRAY_MODULE_MACRO",
> +				     "Prefer each array element on a separate line\n". $herevet);
> +			} elsif ($inline && $line !~ /\]/ && $line !~ /,/ && $line =~ /"/) {
> +				WARN("ARRAY_MODULE_MACRO",
> +				     "Prefer declare ] on the same line\n" . $herevet);

Small grammar nit. "Prefer to declare…"

> +			} elsif (!$inline && $line =~ /\]/ && $line =~ /\"/) {
> +				WARN("ARRAY_MODULE_MACRO",
> +				     "Prefer a new line after the last value and before ]\n" . $herevet);
> +			} elsif ($inline && $line =~ /,/ && $line !~ /\]/) {
> +				WARN("ARRAY_MODULE_MACRO",
> +				     "Prefer a new line after [\n" . $herevet);
> +			}
> +
> +			if ($line =~ /^\+\s*([\t ]+)(\S)/) {
> +				$spaces = $1;
> +				$herevet_space_add = $herevet;
> +			}
> +		}
> +
> +		if ($expected_spaces && $spaces) {
> +			if (length($spaces) != length($expected_spaces)) {
> +				WARN("ARRAY_MODULE_MACRO",
> +					 "Prefer a align parameters\n" . $herevet_space_add);

Small grammar nit. Shouldn't this be rather: "Prefer to align 
parameters" or "Prefer aligned parameters"?

> +			}
> +
> +			$spaces = undef;
> +		}
> +
> +		#END OF ANALYZE FIELD
> +		if ($line =~ /\]/) {
> +			delete $array_parse_module{$key};
> +			$expected_spaces = undef;
> +		}
> +
>   #trailing whitespace
>   		if ($line =~ /^\+.*\015/) {
>   			my $herevet = "$here\n" . cat_vet($rawline) . "\n";
