Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089651A2380
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Feb 2025 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952380; cv=none; b=Kc/AKkWIquJ6YtRO3DFQ+HQSrR+tfMKOBBhusDSpWbnLOcxc4hf6AgTJ6TS+1kcvro3aywJemPDhL4mdTsBQmwH2M5Pk2SZwD03ztyWxvHFGKFC38EhnInJu//ueMq69o7Sn6lcoPuP790w91PWioXepLyXhnOYWcLxfwEuBfkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952380; c=relaxed/simple;
	bh=C89ZWnTNzTZNoe/uDJ536PwYsKPB5iOZBV+ONxqmA4E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T7x6QNWW4K/53Pm8qtIe/EG6xfOMc+4LYP03Z0b/xaDw6N9QYxibXVgRHq6gIRLekP34gYtlI13RKhdiq/2znQ6d4LWDA0umbQZE9N//Rsnp6hgaWbEaR/laVL/v/tvVAstVbTVA1VLW+rUvhn55FIuDwnDSpOPHn36fJU1hdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=IYwb1n0r; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="IYwb1n0r"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1B264240103
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Feb 2025 19:19:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738952376; bh=C89ZWnTNzTZNoe/uDJ536PwYsKPB5iOZBV+ONxqmA4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=IYwb1n0r07o69jiJhAn+MgtvtlHDF3QAjZQk4gfdn2fIUE59BcXFLlHP2xvqqizCA
	 zczY2zd1h1PXSlxBCkWX+U3vxWfHnwgFvcrVM3p6h1t8QSZQ1auROml6lB/vClkLm8
	 X/e+mSreiKrESVqW3DDKecym3060FjSo5PL1cVEB3fcHXhVwv60SwHvCXgKFBDBoS8
	 OpatZJeBLNL1bXRnKE2E82L1C2Ns88/D08Tanlt2xkHANYVPmFr5lJeLh2FyFVGx74
	 Kh2Rj9KalU43ZlCv52OfU4eMGR15DOTTpdKkb0nqURlxNAqW4Bg5NWSwANM35wXJoU
	 8m1xWkY/jHsdQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YqMgp1FsPz9rxD;
	Fri,  7 Feb 2025 19:19:33 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Alban Kurti <kurti@invicto.ai>
Cc: Joe Perches <joe@perches.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Mugel Ojeda <ojeda@kernel.org>,
  linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 1/1] checkpatch: add warning for pr_* and
 dev_* macros without a trailing newline
In-Reply-To: <20250206120911.175884-1-kurti@invicto.ai> (Alban Kurti's message
	of "Thu, 06 Feb 2025 12:09:12 +0000 (UTC)")
References: <20250206120911.175884-1-kurti@invicto.ai>
Date: Fri, 07 Feb 2025 18:19:33 +0000
Message-ID: <m25xllr51m.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alban Kurti <kurti@invicto.ai> writes:

> Add a new check in scripts/checkpatch.pl to detect usage of pr_(level)
> and dev_(level) macros (for both C and Rust) when the string literal
> does not end with '\n'. Missing trailing newlines can lead to incomplete
> log lines that do not appear properly in dmesg or in console output.
> To show an example of this working after applying the patch we can run
> the script on the commit that likely motivated this need/issue:
>   ./scripts/checkpatch.pl --strict -g f431c5c581fa176f608ba3fdebb3c1051bad5774
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1140
> Signed-off-by: Alban Kurti <kurti@invicto.ai>
> ---
> Changelog since v1:
>  - Strip comments before matching to avoid false positives.
>  - Refactored the macro patterns for clarity.
>
>  scripts/checkpatch.pl | 46 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9eed3683ad76..3256b5f31835 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3888,6 +3888,52 @@ sub process {
>  			}
>  		}
>  
> +# check for pr_* and dev_* logs without a newline for C and Rust files to avoid missing log messages
> +    my $log_macro_pattern = qr{
> +        \b
> +        (
> +            pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
> +          | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
> +        )
> +        (!?)
> +        \s*
> +        \(
> +        \s*
> +        "([^"]*)"
> +    }x;
> +
> +    if ($realfile =~ /\.(?:c|h|rs)$/) {
> +        if ($rawline =~ /^\+/) {
> +            my $cleanline = $rawline;
> +
> +            $cleanline =~ s/^[+\s]+//;
> +            $cleanline =~ s/\r?$//;
> +
> +            $cleanline =~ s{/\*.*?\*/}{}g;
> +            $cleanline =~ s{//.*}{}g;
> +
> +            if ($cleanline =~ /$log_macro_pattern/) {
> +                my $macro_call = $1;
> +                my $maybe_excl  = $2;
> +                my $string_arg  = $3;
> +
> +                $string_arg =~ s/\s+$//;
> +                if ($realfile =~ /\.rs$/ && $maybe_excl ne '!') {
> +                    return;
> +                }
> +
> +                if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
> +                    my $lang = ($realfile =~ /\.rs$/) ? "Rust" : "C";
> +                    WARN("${lang}_LOG_NO_NEWLINE",
> +                         "Usage of $macro_call without a trailing newline. Consider adding '\\n'.\n" .
> +                         $herecurr);
> +                }
> +            }
> +        }
> +    }
> +
> +
>  # check for .L prefix local symbols in .S files
>  		if ($realfile =~ /\.S$/ &&
>  		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {

I couldn't apply this to my tree (with rust-next base), but manually
adding the changes to scripts/checkpatch.pl works as expected.

Alban, can you try resetting your tree to rust-next and apply this
patch? I believe (not sure) there are some indentation issues with the
code.

C. Mitrodimas
