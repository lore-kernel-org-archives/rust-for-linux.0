Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95B827816C
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 19:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762678; cv=pass; b=S94V1eL3R7e/+ezlc+pROBlTPycXt6YS/SRbS4eK8Lz7Xw9Hd9CIS0GERM8Z2TAEg/dh5c85LQvS2I29je9tbINTRKP4oYF6NTVwL1t5yVx9VGXfOK2GGK0juQuL6K+QsB68WCurCHDkz3ZQu2O/T++5kts3RtgQQ0DCdK6PgDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762678; c=relaxed/simple;
	bh=GYvQZtHKiSZ9Cl/h8gn/k3hLFG3jFxoOR3EaXdOu6tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4TPbRR2bR26m/yiq+bM3uBh2izBZhcQR8Gn3aG5qP5wc3+hoC8YMMj3TKS9tVl1Dgz2fAVNsGN+vC80yq0TDlfQF15Woufoj9S9TWKeCz+GiI1Ytof0UJnKuGIjOj7Y/cENIFqQE+GwKHqKCtCfAazKTMV/uN/HkP5InWySESY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWSQtuh0; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWSQtuh0"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30e869ebc19so184476eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 12:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782762677; cv=none;
        d=google.com; s=arc-20260327;
        b=BkWxfbH2p3LjxIer9CJ5Vjwdml7nl/GrdquL8B6y0+S2cMxHMWN6yN5/P9nKWx2qDb
         Iith1qKf6jPiESDXz6pIy0czJG9ner3kDBM1ewMXurG6eeOLxi2VTxURW06llIaKoXre
         P66vCJgdJbzsN1ERKeYj0ymcqciwLzEXT06do0mk8lVaRStTL/uZTMiU91QG/ShGD44N
         Fc2R587TN1T0OW0URobpU+2p0Ub7tIgIouF3V4QCsClJkN6WNETg/tQvoWZPtVTQx70s
         31CZIpEAlwLXd/QL6CiD9GGRMVCNJyO9bH8kX+jvuCdL1PuMzfWQFD955FSp+kGBf71p
         fjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GYvQZtHKiSZ9Cl/h8gn/k3hLFG3jFxoOR3EaXdOu6tA=;
        fh=V1CNvy4l8Sg6xX4yMkgeCsiiWFZCD/51O+nl1XbrGPM=;
        b=pLsY0wCgQBIq7LB5JiA2kVkOK/fwg+uTlMQBK760nFA7xlNyqEca1IEGx0F9t/NmyF
         rO181I45f13huQELDzMo4aEUGk0RBjlFwPsXDoBjBiyNxVjU7g0fDB3dAc4nP2gRTSBq
         jzEhSsOBm/Q6ZZt56D10rBMAE1uZh5BmFI8XeNWRRQbVpikWBll/s205eQlc/BiEO4OB
         kahiC8IqLv7+snuxa7HxFgpjPfyPGaPM58JJRjoTYLhhi2ZgD7FiLS8NCfrEtvYmNV1s
         uzv868TC7/uToG54EjFF4QRruqMKp2ApnAX9SyzmOukUvhZfPom14j0J6l+7vBkl/5Sj
         PQOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782762677; x=1783367477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GYvQZtHKiSZ9Cl/h8gn/k3hLFG3jFxoOR3EaXdOu6tA=;
        b=FWSQtuh0UJpDJu1mNYhBzOPYoKwbuKvmzBlNUiOErkzhkMa41en/UIDgULg/UtlRdq
         uh7rvF5ViOV+NPdw/pF4bdQaQNiVAXcC0/G6yyc+E5Zj2sL4kkJuptbebASYhcH9W3bG
         bEKJai5XSclVrC81x+7bJGon0C0KGyLGN1J8Biq2VmOmP+B4GYudOH2OKUZTfyf9QHkA
         Njl82L4RkdoB7VsbfOrmJYlTiplNfigk0GvRVc9g8PcCYsmjK+v44ZRJ1RRMdmsPflp9
         GRxk6x2xGl3sBKGO8BKG5x36IrEKI3PY9EI4D7ewFazSn1qkDnK20bJGanp0iV8jto0p
         oIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762677; x=1783367477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYvQZtHKiSZ9Cl/h8gn/k3hLFG3jFxoOR3EaXdOu6tA=;
        b=dujRmI7TAOJR6x9cQgpg25RqBaU7ciiQurDahRMhSQxGrUR+J9ieReQpplrtxD8Air
         qEsyKqCSacUgeAsxQvbWEZ2aG70E3/HPzQJQlcJFlRFmcIVEJxs4EQSIiqTvbOVJGEnL
         LdbdJqqXSqUuLUbdZW686kFWfdVriSqoys/N5Dle7WCltUwoj3RZ4oWt56nw/4scry27
         iuG4qQrAbNNCxfN4ojvUJQvGZm9mftGhDSbREbQj4uyEqK2Xu92U+TBQ1jPAj3H0n3NP
         coqkINYg6FMe70DxYFvcRZuSwPpCv8mVw0PhTAzkWmp0gP+eLVYerjHek8j+TsWsNNPr
         nKhg==
X-Forwarded-Encrypted: i=1; AHgh+RqIwKbHKUTOJbfyBzurspnrLo90LqNLoi5AWN9wzS2Djhra9DBjJyQ41TJ6UDryHnLOmaZoaEzosUqZhMPVpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjWN7dmJhDKe6RwrufiQqyNWiBEApfBqhhQ07m5RF1ro9LV/bv
	A47F7cGwQls5mYeF8s3nj7TkL+tKx6HgGu+vhZ/TqEOgLRCiu3/G5IwDh7qkgi31+3ClryEUwTk
	qKPArM9O95GvAd9/6QGJpKkCyChBIaJA=
X-Gm-Gg: AfdE7clB+gVuf6F6QwbvXJm4D5Ru0cpqmbFnzx0fGjaKTkgDVzyAm3Y7Hqus05WeS/h
	HptWLvUtRaLdXdb2cymlKiJDJkNmnTHBGv6bDEe6+f6Gtr/HO/soAAd2wevbH/VKvvaINzXIgHe
	GeU1F5VV+icVZDsSOZp2TQNkDyXhlArIXssF2meRBMlBCN2Q0YU9CdPW5tmD0sUdhELexjJZCVr
	behji0K4bQuMyuSCAz47i0g8P5+8jZazahPSgft8IJ8H5VIgzsH7kXjP29sMwMZ17CLzpVE34dt
	6zPq8WCMM5MfJi3gOAgXiZ/TU30hKE9iP+jxudvK8ZAmk6qO6BhvYcB2DvZlOW4gdNCMLCXaUlC
	5Dm4mdelkBzIwpczMZNGgBxc=
X-Received: by 2002:a05:7300:3f27:b0:30c:6a54:3fe6 with SMTP id
 5a478bee46e88-30ee147fc23mr224426eec.8.1782762676955; Mon, 29 Jun 2026
 12:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626203122.713317-1-nico.antinori.7@gmail.com>
 <DJJOZNFW51LZ.IKTXQ8ZIVO55@nvidia.com> <CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com>
 <DJLSIEZ5OBYX.APFOKYYKPU5C@gmail.com>
In-Reply-To: <DJLSIEZ5OBYX.APFOKYYKPU5C@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 21:51:02 +0200
X-Gm-Features: AVVi8CdBhkO1DZcCDL2isjLxHOFx3Y1StSa9vQ4O39-R9Hyrw-U-_JqScw702ps
Message-ID: <CANiq72m80vip+hz5RngvgH4VxU30amzS-ePr6KVKwKvhf3=Ycg@mail.gmail.com>
Subject: Re: [PATCH] rust: iommu: replace core::mem::zeroed with pin_init::zeroed
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 9:46=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> If it is ok, I can send a patch modifying the doc comments to link both
> functions, noting that the const version should be used in const
> contexts/pinned objects and that `Zeroable::zeroed()` should be
> preferred when possible (as Gary commented in [1]).

Of course, please always feel free to send a patch (it depends if the
maintainers end up accepting it, in this case Benno/Gary, but sending
is OK :)

You can also send it as a PR to the pin-init repository -- I think
they still accept both patches here and PRs there, but a PR there may
be easier for them.

Thanks!

Cheers,
Miguel
