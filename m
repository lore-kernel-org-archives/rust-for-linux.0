Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DCE2FD1DA
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767529933; cv=none; b=CWgGEH90sKM5EZc7xAeYBJXHUoG4xyGB7Q/1Zhh/C9UOwBfZgzqD7HylhfygZwhapjYHFhJcAKlSmap2N285VT3+/smW2Yv7p+MEadON2Wn5guOWWS6f6dH2m92S8HBeLFm9JxwIYxr5bOpjF1pBJ3ZoQdOH5W6zSq1qg8MyIA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767529933; c=relaxed/simple;
	bh=Dy90ydZC3ZdcbNYymaJeHe32ZCOoMbKQWnBxgJoo2dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9KsjvPf4IQeQcL6fSYyTK7A4VrmKZjl6JGIMpSjptMsSO4ZBz0BitaOM5g7zhzLMMt3x2PXMtYJzHclVPtc73z1whK/+5mRvD+PQh5n1WuYN5DS4SHNWQgF3Atc0thvy7lkzmhdE9E9v5AhbfMPTIF7NLa+iq52FzOBWmKhb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYnrZef5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYnrZef5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f08b909aeso33475445ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 04:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767529932; x=1768134732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dy90ydZC3ZdcbNYymaJeHe32ZCOoMbKQWnBxgJoo2dw=;
        b=XYnrZef5SiRjdfVlSjbsm0xKJO6AZR7pKWMjZ+i2nXGx/tYfR9CMwHBro+pcFRI1ds
         Mun7eJtmiebrfnHlWdTIesSIsmwegkgq/VJiOjnG7RlrduCxzVMTG1Em+Yai+RSLZCCa
         fyDni8R8m7oz57kJLFSgapQO0u2wpvbwa52Gjo2zZh5dO57N6hC3asbpzIJnDLUTV/TW
         7Q9EMjDU0JozzTj7IOZmcxIEU4gqnyDQLcXPLHLAlnpqRFr66gW4NmznU5uzwfVMRcrr
         KjLxkOPTQzEGr5mN0uYvgI3OPRxc+M7fz0neo0ItO+E9VvBJaWaUDD4wgiksdoZc7wOA
         Eh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767529932; x=1768134732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dy90ydZC3ZdcbNYymaJeHe32ZCOoMbKQWnBxgJoo2dw=;
        b=elbsWI+yH4qG0pquFWjy1sWOadxnaSTRrdCYIIZlGA90evDE7gbbX4ewj/f/QJL1zA
         fVnKl9suXipHbCKn8X7GzFqyo2pQcjqIRkHQgz2Ma14AmVEW5fsY2IA8NuVwfT0VJswd
         vVTBpSQ+Jx15VnjXL6iCllJAHdzTHebu2nFifDLdG6HqUV7/6HW59dLqxY2Pc8lj2ph0
         fE0dyg7t5d3VhMm7S3E+hg4bnWULFP9iuQ/k1ppDuZaKUhEMwTWXzGYwbd4JvGOCoDpA
         Dua+Nj7FVn5inci/AEWTFXluCdhfkwyJMxia4iD5pjE/ayKCzxVjW/DrK605b+VjMcuA
         urgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNbrvEUzYI5sRmU2GKU5Y3KLu1vx5ZWr/iA3/QV2ysC44T0+hrSofrKmL3PpxGi8yO8SK2F1aen+4Vevt4Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8poPDadaclyM5D0MafiZGQ5pfrX4SATiLsTKomEU83r7Qtl5o
	8ZzLrH1tNtwkv+jEp255ly7Y8JqLDTx1/+1ktybvpcfq5i0o73ypygP3hLTqBZrfnb1UwJXIL4s
	lJYKLDnVK/sqvCieEmwE52CDHyE59mQA=
X-Gm-Gg: AY/fxX7eZHow5fu0JXTMKR9eCj2wvu63A5EkmaDjCfXfY75TSxjM59cWmYdg5zHTl51
	4biPXnIk68gdCPh2GKyaZrlnkZXxeI0Swgqq1NRA4CEw8UKKZucbfSbJm+P3rfqrrQFE/6luA30
	lghR5Mc5xHac/X4VBrSQBBYVB2edqkq6d4gE4A7gWHub663Smh67FzgG3m1SRvyqoScJiEsy1hJ
	4qJoJuKcbgA1mhGBH2eys+/16CoEzbls3CrMGXWxhRESRprDdfpcqgqYJdsvpJuiMHRN7ZVYw7q
	btREgsMcgJi7gH4MAH2xMtXl0nkxSHd31C7QhI95fQ1OGH/t+FZtQH+oLREmWaODpzN16JKyfCG
	7rQ3eNgPzWKJx
X-Google-Smtp-Source: AGHT+IHf7KpKpbJjsjinhofN56soZ+FW9sI05KvxZsvyV3VyGs2GMrGDywwEqQ8lvklCE76LNM4JtlcDP8BOPIC6r5o=
X-Received: by 2002:a05:7300:c695:b0:2ae:5f73:1968 with SMTP id
 5a478bee46e88-2b05eb7b6d1mr16001886eec.2.1767529931694; Sun, 04 Jan 2026
 04:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103-add-rust-pci-header-type-v1-1-879b4d74b227@gmail.com>
 <DFF1Y5LEQ85Q.V2AC0R1EFXNZ@kernel.org> <CAGAB6648kOCF4GZV=wKUxEptzW_91BySPMqFSjE+L-TA3ufH-g@mail.gmail.com>
In-Reply-To: <CAGAB6648kOCF4GZV=wKUxEptzW_91BySPMqFSjE+L-TA3ufH-g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 13:31:59 +0100
X-Gm-Features: AQt7F2qedD660SgLCt10xNgjysXE_wVd0hQW4dUtEw9YoI3cwjDMZMBc39nOS2g
Message-ID: <CANiq72mAcgoX9RtM1qZCQNeNYRJQ0soy3G6WFa0ELFGDTGRhjw@mail.gmail.com>
Subject: Re: [PATCH] rust: pci: add HeaderType enum and header_type() helper
To: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	SeungJong Ha via B4 Relay <devnull+engineer.jjhama.gmail.com@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 4:39=E2=80=AFPM =ED=95=98=EC=8A=B9=EC=A2=85 <enginee=
r.jjhama@gmail.com> wrote:
>
> Yes, I am currently developing a Rust-based driver for nvme and ixgbe dev=
ices,
> which requires identifying the header type to check compatibility on
> initialization.
> I sent this patch first as it provides a foundational API for the PCI
> abstraction.

In those cases it is usually a good idea to show the initial user of
the API, even if as an RFC patch, typically as a final patch in a
series.

Even then, landing the abstractions usually need to wait for the
concrete user to be ready to land, depending on what Danilo et al.
decide.

Thanks!

Cheers,
Miguel
