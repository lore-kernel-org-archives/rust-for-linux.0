Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96811314D27
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781717; cv=none; b=ObZbZ12AbaCRIiRD068jmJPgYyb9SB4rBA77ZHkt5Ge6A8ILyFKBhw9yNu9CSqHcvFWO3m/diZ6f3+YxcZlmALnwxHDRDjJ8UJaRsDlyHMigXb4RdsT4MVOK2lZohvkh7SKbck42nL5vFtjSf/sCXLZ6OgzA6QnEuRyk8KYfV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781717; c=relaxed/simple;
	bh=lJTzHX80gcOt+ynIbaRl5FvzwWQVyPrlRODf/k1ryGc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jH9nHC8L2lBLqsykyJ4SKnv2dQ16eSf6s96yI+THvknC8igrj8xJKGa67HFKD/WXPMu2ePPl87JZ2qP6sVf+MM+hbUJ57oosu/rsvBvZ3MGUwdgee5x5eAwOygbGMGNkKme0nIMbOcDgI6DDRPLQU2oMODrKVUaGFHhpU0kbUGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NmMy3omp; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NmMy3omp"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429be5aee5bso1343072f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 05:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762781714; x=1763386514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJTzHX80gcOt+ynIbaRl5FvzwWQVyPrlRODf/k1ryGc=;
        b=NmMy3ompkpJ7M7DZcb9QIjXGen+v1jnvVkANE9ZmA5pYh/Q/flffBFWd+jFniMYMOS
         /PToix+QODa5BRG2vc/+/RkUEKH7sHxyuURW57993Dqwl/oGfB8C+/6jlk/nNO0oA5jQ
         l90aSscFt4Tv2OOTKLYahsafAlTMnkOWzfsYvZFrEAIoA6t0e4vKYqwxrSV0dS6vv79b
         Ip4MuWpB1cURYR5euwiZQYAEotVDK9dSSB6xvpaSMAeRDRnmIxiAaQPcY/UBzjsTWQo7
         cxXjjiQjomtWuairhCamQbYZIcsCQjBWVCOuFefNCECIVCW6q5KMd8OHatNfoVqWy8HV
         3CwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781714; x=1763386514;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lJTzHX80gcOt+ynIbaRl5FvzwWQVyPrlRODf/k1ryGc=;
        b=I3DtkNj/TWDOe3ma11jvxXaJD/mNyVyE0BVvuosYUa8Vpm5iGOMBfDpHnVyNWrXHCM
         wR86d2XJBu0jKi4/5T75VIn4NX3+3KPLob9/WEZySjfho19HONVqecK6siLWtKD0aBEY
         LqOm2OzaZ7vyyrciniKPCDbnzew/MWkys9FbXJPIBuqkxb86TLpYz/1R5E1sp1uf0paE
         ZecIqs+1rY0zwMoz21qCLeDIxQpk9MTz3m1PqY7I3yhetlDCPhBeAoLFB/jMY2QfVRLb
         uu9nqnCJ5oMRsxbuJK+M1Czty1o1VBJyYkWcpvHz5I6CuOuNCXw+gugduF/fQm3g/ApL
         H/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGavPkg/PjU8Bi0j3pakpueri6ShrcRnUMGFhiz7wUiR16IjYjnQ6l2mR4jDcr965iIpaNcUGxEUSq4Do7+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRmGwe/cDgrSDat5r0vfeyNNL/T0DB1DsNATtDOcrtfsycJDz9
	h2gdttnulTk7LZq6TLYmP9D/hGAp3LB0zW6WJLjI4978xE9+0KaKsaOq2o1MYyL/iQHSfPLnhgZ
	9lnnPC2cuRK1UtVxV7Q==
X-Google-Smtp-Source: AGHT+IGnJplCiE5BS7Zbk5yxG+qcfdSbsxfffIFOw2vKoXQs/5pM3T2FKjbg9K9S0Pk9TrgnCi+z7Nq4/0WV7WQ=
X-Received: from wrtp8.prod.google.com ([2002:a5d:4e08:0:b0:429:c4e9:626])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:288e:b0:3ec:db13:89e with SMTP id ffacd0b85a97d-42b2dbe331emr5614498f8f.7.1762781713969;
 Mon, 10 Nov 2025 05:35:13 -0800 (PST)
Date: Mon, 10 Nov 2025 13:35:12 +0000
In-Reply-To: <CANiq72nkjWbtEktSU_TrEfY2Agy7FK0-OLBWPLqTvp_p-CkBUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-14-ojeda@kernel.org>
 <aRHQA6FEoxACerIQ@google.com> <20251110131326.309545df@eugeo> <CANiq72nkjWbtEktSU_TrEfY2Agy7FK0-OLBWPLqTvp_p-CkBUg@mail.gmail.com>
Message-ID: <aRHqEPN-aCI5YkIr@google.com>
Subject: Re: [PATCH 13/18] rust: quote: enable support in kbuild
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 02:22:53PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 2:13=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
> >
> > This is to be able to skip over edition flags for `quote` when building
> > the rusttestlib?
>=20
> Yes, it is needed to support skipping the flags, which isn't needed
> until this patch.
>=20
> It can be done earlier separately since it doesn't hurt -- a simpler
> option is just to mention it here in the log.

With that mentioned:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
