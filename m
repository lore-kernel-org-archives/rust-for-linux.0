Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D328D8ED
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439765; cv=pass; b=HaMWiP+i08PkoT+bxAruyeottIhHtWeacpkwFrmCenzo5GsQd9MtRLEWBR92GAA8VgfK7QWWM8cNmMqtard8MEX4W2LEuRAQRL3EFTdHvggKL2OMqB21UbRm6+3oFKM41LBC8LqusPMCOAEX0oODwXmpdFm57dApBpCRZcerlDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439765; c=relaxed/simple;
	bh=rp5TqfE9zLOyeqnvzDKD6I0dAZPw6wy5AXjvt9LXXnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcEkM6pqVtvucTI691oI4ny6LUMtoONOc51do+40c+GtU8jA/yP+ViteYXzMjQ18rwBORNvqsixGsMiVQD5k7hDQOB4Hd74Fu99sm3xKaQvgnFfcdpwL6eOddooqjsnLxwSuSgxy+pAf3SOahOEGe/1cRq4eJnZHfgduE5jTQsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e310jtMR; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e310jtMR"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ae5283dae8so296116eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 07:02:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769439763; cv=none;
        d=google.com; s=arc-20240605;
        b=jkysmtxmlk9fAy3sDvlHlNOiYUW+AmHwmSYsypxztFAuwG261vLBbAnBAS44yhgd5I
         qCP1+yBkqBsYccSdraPa3bRzt9E4zUUhi8/8PYIEaK624AFdn+5LEHEczKoDSO6LamEE
         /xWyqdr32CjfT8xNS5QegcnjFaUBaSJw2CldCPgSr1EBoSdez9LwuPC3Sg2hgvINMzob
         MosScCgMotQaUiKgeOHIjYsCDlZw1yL9y+LrIwanQhxlAbIcAgC+lyU4oRer49+TQ784
         Limc+DzpUmpTIrtkN4wEEkFJmRchnJT4Ixl/W0fPMWMOiZbkl4vTF0wYvSZwxFzsDcTX
         hfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eoxvPx9TbIsdy8t0Ge6WCOFlFgsktrXqmBZ3k8r6Wtg=;
        fh=BzoIUFZ68P4XNmpo6ZbdmYfPWn/ZHWqm9+0ziX5Yl90=;
        b=L5ypt8CRQ4G/yNL6MVkPqk2qMm4w5kXk12mZpxpv8+nbueVsoSPaBlM8WUytPf53CJ
         IIUIlrFvVNfFbyEZlGts6HRQc9c3xs8BgZtW0kGYHABJNR/vIFFKJ1e7ScVyNqwCRNkZ
         jwjpHD2FYzkwJSgDT+rzB7lQ6XSOALcr0y12aij7oQtNe7pbT0AWA68hfXhRth4DwTti
         5VINGiO6enZpDS0YSyzP/uMGIK2O5w176quAmiaJygzmyuJfJROMiYBg4Yz+Di6/9pR1
         R5W+7KxXXjFEUz5I4sr2rRzEXfQikASky73oPqo1XWpTXwkWgK8Jot5lq8+690nrpWIO
         GTBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439763; x=1770044563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoxvPx9TbIsdy8t0Ge6WCOFlFgsktrXqmBZ3k8r6Wtg=;
        b=e310jtMRsmO2U3ZVtQCqYX2HydtBAP9CG2AJTqq4zRmMLfkKOHF0wW0ZzY58jg2vFu
         xPDAKguf4kCCAEoAqwPy4GfXadjcqo8FQFndUxNPxwzea779/spRMShxhuE1z8pvLBl0
         mrZKj5zyEgI4XeU6UiSh3KSskPPZTqy2tL6mfz9ubeviflLvq96cktlcurNhcoFfreWI
         JZR7ct+5iSnEc17l5IOK7jTKhdLccmvYzBEM0pVgkF7mZdJRLhR8Wb0/N+lCIAHUeN/M
         SKOjbGdAZiRSqqzUmMEJw2P/9iHsAF+jf5sdDoZ0CmFSeZJmR8nd2wW0WfFwqcuUqQH9
         gkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439763; x=1770044563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eoxvPx9TbIsdy8t0Ge6WCOFlFgsktrXqmBZ3k8r6Wtg=;
        b=s64jRyHCbRpbcDFSizSboQnPe0V3zE3OsNTKJEQldJasmfZlbEpra+hwnq6UHS1XGB
         FlAXtV4kWXyrLza0+1MGOPKJ00uUagNWgtaDny6YdPJ9ESjP1b6H2w8X4z2BSZyTCZlH
         V+xJDU4zz1PwzYi01o4kwgxT9J13vGLAqrEKaVn/MRSr6d8PM6HVMxqkiinsN3MQrFCg
         M+ssi4Mc6EMTJxEB2gw7Rv8QghxM+ZXkv3RBf0yKr3IKPMgfyzljN1CdgOhI6c8lqH39
         DEV4XzNZ968McfPTpwmYBKoMg5aHiTEQSxmQeGnD9qSx2y+AeAax28enT7q5RFuBjjN3
         qjoA==
X-Forwarded-Encrypted: i=1; AJvYcCWPCYFVtvapACjt8X9OHe5JPWPwILBND8lABoItK9ww5rD5vubvCu1u4E8/CaUJGOUUv+iNMFEa0qzFeVJkwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTgp6bCaKiPXEzafizSo7ySv66EBnSqKSlOZ//4C14hPRKcvV
	3CTyZSc0M71F913sACaq48nzDf6/O6YcvB4bzG9ks6DgNp4NzhYrjQpm4676EOxxf2BZ3nA7Oek
	IDA15Jx5CfFdp4oPXMrYyPjx8w/ax6LpEhunjfyU=
X-Gm-Gg: AZuq6aIltHArq74AVx0L8Bc8iP79xy8OVFzp5lgjpkd31EcXmpxwhRSYaoQZ3V7PmZ+
	zS46QOVCgqk/LcQtUA0p88UOQEgUQPbwR/zQCUXcKK7Dqn74Q11hPBwcQc+lRrJ5gpQl+wAMobx
	2VUwQGWN9sbMIBsLfZC2s55mW6bnewhmPKMZ4cmig5M7WqtTHp18XBQYiEVCNZd0fKtNB5NIAZE
	z7iGlrQBKkFyM7JvJSCO7eI6eCvnaJmIQ3UDkdpPPtl6EUmrMdACG+bS+ZCC5nMtn7vepBAYDjN
	tFUlqnbcuwrPcusSul7YuyA54WIDBqROC2XOFH6eD3NpZDz/fXmiU48iTDJY9JD2aLTNdWfvqao
	JuCyl5vPBGQB/
X-Received: by 2002:a05:693c:2c0c:b0:2b7:3678:2d1a with SMTP id
 5a478bee46e88-2b7645253a2mr1242478eec.6.1769439762862; Mon, 26 Jan 2026
 07:02:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net> <20260123172007.136873-4-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-4-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 16:02:29 +0100
X-Gm-Features: AZwV_QgiX0eFATH2BS-cSgRL-nHZ6-2MaTRUOw-3ELWcT9aDkkatEcTOGy3AegQ
Message-ID: <CANiq72kKDx-A0uLcRzau771WQNJG5MLrz_jBkY9hD=NPNkKbeg@mail.gmail.com>
Subject: Re: [PATCH 3/3] samples: rust: remove imports available via prelude
To: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 6:08=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
>   samples/rust/rust_misc_device.rs      | 2 --

If Greg/Arnd don't say otherwise, I will eventually pick this patch
including the file above, given it is trivial.

Cheers,
Miguel
