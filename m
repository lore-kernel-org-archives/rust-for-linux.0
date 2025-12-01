Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C595B21CC4F
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 17:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608690; cv=none; b=L/WIymT6hjkgewaE0A0IWvNfEugjYHrD93o0eUfkt2E0qy8QWYI5XEbp+2R9+t4XQbnGgfUBvlzDqj6pGEhAiyzVo9LwzZlNOTXKOHlARh2QLKC3rfbTu3RUjcpl9BIPkT9znYL2mvCycjOR37g//ZZ7mRVdo26ZYMJrMASTfVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608690; c=relaxed/simple;
	bh=hQFWd5hxLCUsh/XvZzcDt5iGUwSIIkOBsVYgqsdA5nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzqS9+nGz21dvKH9PkizbMNx41IKikYqT1vLAV818Ib3ZqI3vxBts2lmtmmXJbp0cAQwck0mbPHDZOkXBTuX5A4dKVRpRqK/i1Ep3DlMnfcYnSFYZ1u+XxICtuZzd+3IM+iKiKyDmWTEbeC/vueqSlhUTtfXTRLf7IfBOZwL+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KBFjNyR1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=D+/6D1PL; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KBFjNyR1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="D+/6D1PL"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dKqyN6YR8z9t8r;
	Mon,  1 Dec 2025 18:04:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764608684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5h6a60LhT0vE9Vy07UjU1YMN5/dTkImzjx9cZN5T5ds=;
	b=KBFjNyR1a8Cm3Ky7ciE5L6NATsf9VaTBizXUUiDgtKvFGVSPvnH8kfkGyhTpYlaeu7ttNt
	iO7sRv2Dkfq7cRoJfe/Be3HeDhJA0UOeakco01F5FaNibDbL5qLXFNTF8mMnMedRJ3PKM4
	JxNJIaBTVDxx2gv+FatJbV1rO7P7bjR+3ieH9fT1sDd/jjr7ABVfXjt6VERCuf1WDgCykR
	sJPnRWFvULqXldRGW0sAJMJGEbtOxfVwGzoRi2+U8pFcJzpCCwwLOVvV9hjfwGeHJC4WQb
	cNVaNlq6ZajCGvzLMP2Ptek4EdflF5zXfuvNIVg42lughuJ5dt/lHVfqOPkXCQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="D+/6D1PL";
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=mhi@mailbox.org
Date: Mon, 1 Dec 2025 18:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764608682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5h6a60LhT0vE9Vy07UjU1YMN5/dTkImzjx9cZN5T5ds=;
	b=D+/6D1PL15cn7y36Jm/m+mf597GdZTEIp+5VaE1pGvutMZYxaYUAhv47ZXHqsREOY2yX+R
	s2Cos9I2VJPXW+8UZVouhkPAaPZ5/Ix70hYGxU/DnyHDgRa4T1C/NMdQSODqZjNw+x4NXS
	MvD+NaLKnEJS7SyqXMG3VRXrHQOwHE/+HBOdkmQpFKTstKynAeBWx+Bgv9GB8BEi64j6Qs
	v722MFjHURr9fysTTBE4BS5XyTSWi7scxleyJZgrxBqXxmjPWbDGEEreRB+71OJ0rFReDc
	CmwFFeCo1jKc54Gup2oLDHe8i5PozUENCKyaLxISoPsL6CgRblx95BhVia+CEQ==
From: Maurice Hieronymus <mhi@mailbox.org>
To: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Cc: mhi@mailbox.org
Subject: Re: [PATCH v3] scripts: generate_rust_analyzer: Add message to
 sysroot assertion
Message-ID: <lilor7d72izlp3vvxed77llwmwwy7br4a33sarztj5fapvk7bz@gjw3czxp3xe4>
References: <20251201170130.10922-1-mhi@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201170130.10922-1-mhi@mailbox.org>
X-MBO-RS-ID: 92695666772721628d4
X-MBO-RS-META: a4y1iwnymjcbz9gaodruzzqnp6dr7syo
X-Rspamd-Queue-Id: 4dKqyN6YR8z9t8r

On Mon, Dec 01, 2025 at 06:01:30PM +0100, Maurice Hieronymus wrote:

> The assertion that checks whether sysroot lies within sysroot_src
> currently fails without explaining why. Add an error message that
> prints both paths to make diagnosing toolchain issues easier.
>
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org> ---

Changes since v2: - Rebased on rust/rust-next - Remove redundant comment
above assertion

>  scripts/generate_rust_analyzer.py | 9 +++++++-- 1 file changed, 7
>  insertions(+), 2 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py
> b/scripts/generate_rust_analyzer.py index 147d0cc94068..446d405ef68a
> 100755 --- a/scripts/generate_rust_analyzer.py +++
> b/scripts/generate_rust_analyzer.py @@ -213,8 +213,13 @@ def main():
> level=logging.INFO if args.verbose else logging.WARNING )
>
> - # Making sure that the `sysroot` and `sysroot_src` belong to the
> same toolchain. - assert args.sysroot in args.sysroot_src.parents
> + assert args.sysroot in args.sysroot_src.parents, \ + f""" + It
> seems like your sysroot and sysroot_src do not belong to the same
> toolchain. + The sysroot folder must be inside sysroot_src. +
> sysroot={args.sysroot} + sysroot_src={args.sysroot_src} + """
>
>      rust_project = { "crates": generate_crates(args.srctree,
>      args.objtree, args.sysroot_src, args.exttree, args.cfgs,
>      args.core_edition),
>
> base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde -- 2.50.1
>
