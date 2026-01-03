Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB45A95E
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767448838; cv=none; b=cVZQ7zex3FHzQB0jMpzXIBSsbBdTJPVUWQdshY9AeOEb2VAUfcz6Kr1/Y99miOAJbBv6WqHHbSn/rbP3siUNWoL7I1xW4LqOtb0loRV5aH14IQ2H4OZ+zVmdDuo1+ug5fpycbWqe8Vcqpi3/cMMfV6q9abQ+vvksTkaScz5dnEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767448838; c=relaxed/simple;
	bh=1/0DzGiAJs/4Zud+bIhG0XUAjVn8RU4FU0q7PnATU1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/HGBrpW3umUvbn4Q0koj8kR2ZS9xnnzH7TXe5cPuzZUPjoxMMG1w/isCpbIy+vEkRIp3ZESG0TuGH30rmYFinrpvp0M97zrKLlDCoutPavB7XuiqwaLTY+n4R12xDo3h+hSfS9zAJCSFe+FLL2UdltkYH5kwk1JI7kxiwme4wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua6PecZA; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua6PecZA"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34ab8682357so1452538a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767448836; x=1768053636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/0DzGiAJs/4Zud+bIhG0XUAjVn8RU4FU0q7PnATU1c=;
        b=Ua6PecZAWGFPWTrZLBwDSetNxnvAsWKPetblQyrOmoE+JZX0Oy78nH5yNphxEGPgtX
         ZQ2X4eUEfI6qUOgOMpO8G+Q7zj0euC2oOJpVu87o94a8dL1U7sKQV4UwOsE5uj5NBrII
         55MDgKkIpVL3i2ZWv4F5EmQwIj1MfelapAzQ6C/KdJGpUp9Cbo9TDaKSlZSZ0v3avypr
         td1sBHfwzCXQkHlbnh2dzC38SblvrhS3/SNCXD6pVOmYr/mK+21kdnvaUu8s9N32dDIT
         Pv72VkiVAFHoi80CChpqwiqhYmTKGejqdYNvzRQL/eSxHCwMO08TLa0NZpPhyabxfgnk
         juOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767448836; x=1768053636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/0DzGiAJs/4Zud+bIhG0XUAjVn8RU4FU0q7PnATU1c=;
        b=bp3PIojNdzBmWde6I2RPXRMrW8ZYOJXXopnSpk5iZ8uymp3J61Y/cLWJmIQu5ZGko+
         kDGfzTBkqHuGmM5l32neS35HDm/NuPXwoBs2VIsxfRhS7Pisp9g+kVYIPa5i2qXG7ILJ
         +31u42SHEo+Jqi1c9YnA+dlnslrbkb366ExVnPdQ/UwSZ2Fws1SQGrB0xI0Lh3l0utGa
         H40K5Lto0yOPcOU4sKEKk6jYzo3SejI0hEtXrWz4pD86syDXiVlk44QrsLO47UqP1/ho
         0yhvM2uuAWMqNmP2u0AqpK3a78e6T9GWK8p8UcqMswMpG2JhBBrKDLUpil+82Ltk6udL
         g+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5JdOVCZw14rCgnw4iJQihMVFmol4/wD1U5u1Ud9SwY4KHEitevm5Ko6gK1fRHAJf4+Vx35jwmpxL2HIP8BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdtVXz2p0opyP6Fy32MItfnyKxPHkBpsWJX0B18WqcRR+RVmg
	N3CKAOtyLQw4++DwkFUQS3Y1it9f0nMDLi0eZN0Od7GHjT01De2E3jFKpBXVWWlocD5b6QES+GI
	pZJgL8fR6Pia8WHXKDgNejbyd7UChSdQ=
X-Gm-Gg: AY/fxX5Mjo8Fc0WaMIYDwytEFnr2GYT5Tm7/4Ra/pSVBNLWJnGel9CCBhu5HdHq9es3
	vZWjtomlV+tIca6wybtEpVsOcTGm57Vp2483SY7d3J9q/VM/T0Y70T/NqZGz44pc7jxFBbaZenD
	nEnIEllokUR92LJEGwLbscGrS1EnRDv13Cl8TWMxmJ6CU4eHVav8S9FfcIdObzXpzO61un4KE1u
	KbrUr/+mGvHiBPf0LH+DVUDWIurehaCQSK30Sruxgc1G5Nlt/ZdCA6at7FariBJs2+tMLGUru9K
	H3oUFqiuRelcMC0xzuP0XLK1XgJIBGwUF9NfV6e4rZu5a/0y6SPq590FaU0S8zBDL/HifXptEx4
	+cYcUq7Fqg2Kt
X-Google-Smtp-Source: AGHT+IG/QZU0ZNAdsgk4MXCT0tcqGJYL2Ta8fW1kN+53Yuc+KOkiN6gpNJ9v86oycca5sRGz/uWIVbFNndr0pTHqIHQ=
X-Received: by 2002:a05:7300:80cc:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b05eb787b8mr22202632eec.2.1767448834330; Sat, 03 Jan 2026
 06:00:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
 <E88301E9-6142-491A-ADA2-F3BD8D9B92EA@collabora.com> <CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
 <88BAA5DC-6025-45E4-88E8-396113766D32@collabora.com> <CAC=eVgSKwqxpEPPNv++ipHGJpNE9TxjdWK91N+wDR=L3RibK2A@mail.gmail.com>
In-Reply-To: <CAC=eVgSKwqxpEPPNv++ipHGJpNE9TxjdWK91N+wDR=L3RibK2A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Jan 2026 15:00:21 +0100
X-Gm-Features: AQt7F2pMxvNiiJ8Rcc-7wG0w0HrbzvMuoRuGDyQyUyZvengf_H6QKcuTTXCdcOU
Message-ID: <CANiq72mJDQaQsrWeeUhwoU1neQKOQnqqqo-5OvQ5kTG4citH+A@mail.gmail.com>
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Filipe Xavier <felipeaggger@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, felipe_life@live.com, 
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 2:15=E2=80=AFAM Kari Argillander
<kari.argillander@gmail.com> wrote:
>
> But probably there is no point continue discussion as two people has nack=
ed
> my suggestion so fast and I'm totally ok with it. Still thanks for
> taking time on this.

In general, I think it is a good point, i.e. I agree that abusing
custom operators everywhere isn't great, just like having a lot of
macros with custom, non-obvious syntax isn't ideal.

For something like bitflags, however, it seems reasonable. I think it
is a balance. For instance, `.enable()` and `.toggle()` are common in
other domains especially with a single flag/concept as an argument,
but when working with bitflags developers will likely expect to be
able to use the usual expressions they are accustomed to, especially
in a context like the Linux kernel. And while the `|` approach would
be workable if you introduce more methods like the masking case etc.,
something else like `.toggle(A & B)` would be very, very confusing,
i.e. it is like going back to square one introducing custom syntax
again.

Thanks for raising the point -- it is always nice to consider more
viewpoints and having more reviews.

Cheers,
Miguel
