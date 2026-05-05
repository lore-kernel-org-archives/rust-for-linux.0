Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFE4B8DDB
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005706; cv=pass; b=unn91aYCEQB13CuYdy4g6WxU7PRti2Gh62o84enhOsOaAB3uhtYvmaGgV0+vKgZtw3ZgJV982nT0Nesd5TohjNLBQVNnxrnP8eaqGji/MLe+9bdRTO6nc2mGxrT05Q3kvqOyA6MMTTzhdWR4xQaCJSGBywNQJta12C3rnbM5I4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005706; c=relaxed/simple;
	bh=u0J/DG3q3l3oTdmjlcJn4ywY61k9yybeZt0U6uv+BvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2Dq3O97C5UMR58KrX++JGmsyCaUMH84iWmC1B8BsDNhhznrLYmha5SHthBv3f2HooPNK8gw6xMvXNhVGZc6iQtjsXQFHbYLtuvESZJwOfqbRIWY82u2mrGB5ctW0FoWNGiH7Z6mWGgvZrcc19ml8eE3UHqPe1hUMUxBYSWMUtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACeDXtCn; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACeDXtCn"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f1b00a75ffso225899eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 11:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778005704; cv=none;
        d=google.com; s=arc-20240605;
        b=EbzxgQBAP8sLXhBLCaVfh5YQSsceGWq8/kTo0tvx+HRXZVSNcH6UtM4MnhDxXMWOwP
         C1nOmEu8lkjagH9w1vjbYJW9BQoDLUOyhlisLA1RIpDgrEAqFtGQUhjYCX6+2w3yqCt8
         prrNwH2h5aeQw6RyHVuZ9+5Umz2dZ11nD0hPQRqzkU+VwSVS0U/k7FQAbKMANetgzGUW
         v6GyYDiNv1HMKpL0S5ekqHPcoBRvrcLqcOSa43okhQs38al3hI2gE6rhLAwsW8LbDEMf
         T5UQtKCRxORqwAFBpYoeDBS4ZtXQ5rztYc86MoR9q3v8U1ECwgwh/tVfJBIW6mn7xLr+
         4Bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u0J/DG3q3l3oTdmjlcJn4ywY61k9yybeZt0U6uv+BvI=;
        fh=GUK4KiBHIyCmMb7DrBsZyRA9ZFkcJWgp1XMBc82dc64=;
        b=jJJYo/REun2CMkHBvPL53ooeNAV+efbe0HhsNEdSObhcDo5ZzzlKTb/7fvwt3b+iuI
         OwTl3NsEhHxhpLeZqeaUlDp6VELHZ1q62l0VAqYXy0G4++svICOIXdd+8NOmlshMGEqj
         Yg+0JncLOFm8/NdlOzqS4pIC7SlpnwdIbXRqd141ehTUAQMTmOgGc3eI11Izw8d6afq+
         TZovrtp5K2RzucXvceK7mly1tafEz8lw95ylmo+y28U7ZQv61TUXaUlkFUFEmD/TookJ
         6T7Gr2Tch6lzUDCEnh9RsuOaMsbbym2t3/Y8wkjwDOKhQ24GvKBMz9z9+biPF9+eq6D/
         J3Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005704; x=1778610504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0J/DG3q3l3oTdmjlcJn4ywY61k9yybeZt0U6uv+BvI=;
        b=ACeDXtCnYOB4snzHTF2jdmRyOC+zb3OJ0sb4rMvxcb3oJ22rOd0iab8HomVEluXhmm
         u/7rVmc/bTUPfTef8bgW7hHOMeqieNrkTuOR2fElgTLh5nRs/XdTxE3OFSge+UEYEovC
         Oz8qvIOFPpOJjM6d8V47rkQMqq1HougwbV2YbbJzkuS7I/7QLwAhT2n7b931os5lcJnT
         pv4MElSw9yaZr3Lqn9JMUb27FX6JaDsKa2+T+iM24LC/s6IWgRTY2tV4GqS5jnF2SLoB
         kek75uqYDhjoF5FO92DWeqVsUX+I+aGjBssi4lyoWEW2BtXOWmvOHVWcrKQtdDxB21Jk
         jISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005704; x=1778610504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0J/DG3q3l3oTdmjlcJn4ywY61k9yybeZt0U6uv+BvI=;
        b=Ge9mK64oDvhCskmd6UcenzV+oAe92XNMKLi+bUC4RTO9j0GGQHJbwTyVxso9PvAkqT
         6PQhSPaCet01mGFtUrllqTmlrxb04YDZW3xw74mYd+bp1BOBN4seib3kTSDvtqPi+1tM
         /l4LDSAKzpQ9QZJtKjtvIIqRuW3WlYMHa7W1SD/2/xtvBNuUH3IXoBffUuRiwZpI9Aib
         7J+Sb6cHcNIffKnGqyXNKkI+cCoeA6KPQY5Zfv5y7L6IeGo00Li6uKfEHT5akb01k2iF
         LyX6ORkWPK56cIUdHrUTaaAf4P5NtK/YU+IHdInSCgd3OOLwgZPy9os0diDzg+lAQXWW
         NU2A==
X-Forwarded-Encrypted: i=1; AFNElJ/A8D3EV3fP16EAHNVX0F8IN7K06ObNb7WS9+iPTmc3sDy1pLYFWnl7cTwPmJ1yIWjN4mDSnYvhfIH+gTHJrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnktyU6ESTEMAWcaOR1eaR7tpCJEb1pqtDV103lF1tqu/+Cy5v
	bXtf5IHSPQctwzr3zaDSYZN2bKl5pgi9ZwFG79BN8eKTq61cGYstINriU4B3qsrYYhaMg6Eyht/
	5i/bjnCWcO3zoHToJiRNq4XwLLHCPVAc=
X-Gm-Gg: AeBDieu36tQZ5uAErMlp+skFeLdXgBBmO9PDqzyFgy8znarzFpr1vrwybCQlhqZVPAT
	QitCy9b1/UIChGTRiAnPVlRIlkXBybOsVxjPYMyGtSXOZwXWWHh9rJn9+XX64mUKMHgLRtwct3b
	qGoTDwgXetnIULujnN+SKcJ6bqKi8pGEosJePQCTBUZxgQrUgiSKvig7G0g0Wm2gTeI7JnMSiAH
	AE/giDTYgDzUfA0GDs7lIDizcpNcHTtB3C6gVnNkuzYLiIOzEiTUeTcXmVuaIHG4WZe0t3s/jXL
	nWNF75OvOfeEUfSM5E+M0yUczTXyJHgZ9vNr6eXFyRrrThfo8KMSGrXAwg145R81MbQYPUJsAhS
	jWOCmlsHHb31lZtBX8rGZNnYhNuRsowbwhw==
X-Received: by 2002:a05:7301:6784:b0:2f5:2154:c7b with SMTP id
 5a478bee46e88-2f548a8c16fmr96868eec.1.1778005704160; Tue, 05 May 2026
 11:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504111421.72130-1-x@2005.tr> <20260505082323.37335-1-x@2005.tr>
In-Reply-To: <20260505082323.37335-1-x@2005.tr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 20:28:10 +0200
X-Gm-Features: AVHnY4I1gAHbg4OBDbK2BRfiEoG_N6cd2k5zc2o6_6hC4CBMbryprYyf6O6Wea0
Message-ID: <CANiq72kGEB4769kC=-S8e6eY_xqwHTtmbuTvVqjsgL18SGPUYw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: io: use newtype for PhysAddr
To: x@2005.tr
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Robin Murphy <robin.murphy@arm.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 10:24=E2=80=AFAM <x@2005.tr> wrote:
>
> From: Favilances Noir <favilances@proton.me>

It is great to see more strong types, thanks for this!

From the other parallel patch:

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1204

By the way, please try to fix the email From header -- it can be quite
confusing to see "x" in the mailing list and other tooling... :)

We also probably want a few more `#[inline]`s as Sashiko mentions.

Cheers,
Miguel
