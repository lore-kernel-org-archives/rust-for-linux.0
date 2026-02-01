Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB862701D1
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Feb 2026 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769966381; cv=none; b=WK/sfdGgfcYtLh2uGcf8VnZ8WUn1CIpXw9hafLaz7SH+PrBOLvnrnxQVZvYIkcRlUg7ty3MyPdCYbJZWS1h/o4ERxX1iLnpsZE92WV6RKNRnQlwOE17hjDqmQqKyNJQ93jDeTRlOGzIeAFc+L0XwcPApKFMY2RK7hPYIYNuNNDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769966381; c=relaxed/simple;
	bh=u+A2dGvmh22PBnfDef6tD22gV02tsewmg4VxKYdjRkM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=olIiu5Nra9B/enbzKQvEmKzgVZDRlasIXfW6vl9qvorSkZjbWM6L5zyUeBljZMTSt5RIUnh/pMuK2Hg21HihJcqPJle+zZwVtDonOiACGgfNsEkwFjJG+Pz9eSpnjiihVus6kqbkhydL0yAWyt7YrszVQ+8msZ/xDc91axY26g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=UH05ZP4T; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="UH05ZP4T"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A6BB8240104
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Feb 2026 18:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1769966371; bh=4z9O6+xTsJ8dPj/ZZ4G6CqSwK9HmAqTkdMlLKzsh9Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=UH05ZP4TwN65nJsRYxor6kwt7dvR7rN5or2HMSYdRTFKJ8+nIrxbC/f7immxd//r4
	 ie2BPdtI4M4Z/DDtq4JjwdnfRnyFEo9BkoDVubkqZRju0W+NVkMd31oPuDIqyXIzHD
	 YAe6WvSxw2usIitJvCx5m0Ja7UU51MJ2w+ruqoOIHFqu06VEwF+C07s4Bp7Krfi0a7
	 NHjc2jCP/gMk3KAog+xHZp3hKwt/YGuSi8OEDf2wFrdzyiAggDiF1TXFN48SJQNHcw
	 r5YCDBOR9VC/7LZFju46L+iPX1FiN64Ot3YSaEtMfGeN5jm7sZR5jTqjAEHGgSf0Ku
	 xGEEBOg2R/M5A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f3xLp3ST1z6tvq;
	Sun,  1 Feb 2026 18:19:30 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Jason Hall <jason.kei.hall@gmail.com>
Cc: apw@canonical.com,  joe@perches.com,  ojeda@kernel.org,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: checkpatch: warn on Rust panicking methods
In-Reply-To: <20260201155718.1623802-1-jason.kei.hall@gmail.com>
References: <20260201155718.1623802-1-jason.kei.hall@gmail.com>
Date: Sun, 01 Feb 2026 17:19:31 +0000
Message-ID: <875x8gqt3y.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jason Hall <jason.kei.hall@gmail.com> writes:

> Added regex check in checkpatch.pl for common Rust panicking methods
> like unwrap() and expect().
>
> Allowed an exception if the line contains a '// PANIC:' comment.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-linux/linux/issues/1191
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
> ---
>  scripts/checkpatch.pl | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c0250244cf7a..fa9f55031129 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3834,6 +3834,17 @@ sub process {
>  # check we are in a valid source file if not then ignore this hunk
>  		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
>  
> +# check for Rust unwrap/expect
> +		if ($realfile =~ /\.rs$/ && $line =~ /^\+/) {
> +			if ($line =~ /\b(unwrap|expect)\s*\(/ &&

Using `\.` instead of `\b` would reduce false positives on string
literas. E.g. `println!("use unwrap() here")` would not trigger a
warning.

> +				$rawline !~ /\/\/\s*PANIC/ &&

Should this be:
       $rawline != /\/\/\s*PANIC:/ &&

i.e. with the colon?


Cheers,
C. Mitrodimas

> +				$line !~ /^\+\s*\/\// &&
> +				$line !~ /^\+\s*assert/) {
> +				WARN("RUST_UNWRAP",
> +					"Avoid unwrap() or expect() in Rust code; use proper error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);
> +			}
> +		}
> +
>  # check for using SPDX-License-Identifier on the wrong line number
>  		if ($realline != $checklicenseline &&
>  		    $rawline =~ /\bSPDX-License-Identifier:/ &&
