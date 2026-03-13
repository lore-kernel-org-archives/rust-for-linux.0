Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FAC2989B5
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773381327; cv=pass; b=jRuur68zc1Ekz6NJWzsHUrjNBjPL5UTe7gDPYHbJNUcCNtAUUJB58izpUB2y98l10+pVINJhYOi4b2OkwADOjPV4nQSvA3qrZsCygIe/kOu4zdhvcaydktq3NMCZNMfVOUilqs9WTejx+ohw13SHNOBm+naaJTwv701lSPgQ1+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773381327; c=relaxed/simple;
	bh=zd0DFMoOUdpXYUPoqVp5qu2gOoi6hEJLHj0/NV4HW50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SemHVtjeR7KZJ+HCGhY1jor7n4YabMp25csdqA6dXPdFwsSmfaxu91Ehvy8LKtejmF4l+UtNJjuNSfU3M20pPSD2pMXiOLhzHPSZtKq0ysAG9n7o8eKPeq8W/WRuInp1qDhTqYmnbRxbwiNlJgsV/kMdZC44sfamS9L27WeEUJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rh3jQZK/; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rh3jQZK/"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bea8e46017so32249eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 22:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773381325; cv=none;
        d=google.com; s=arc-20240605;
        b=G8Iq7Aib47lq4QlvSbFM/ScMMBXlzXCRKrAcwZ02zeIq17ynqSRmkbmUtNBLqlbfRm
         kIvLlx+NrZpzlh35N/emPIMdznQd0+MaBA/o+gI16UQb0er3CFIDqo8lS0eCrhgB4Dme
         yGGvwpib28nAJXBMqOxp9+z1bK6gg5PWKMVKoXgRkJtz4QXTbdRYT2jdSjzfZF41ljIr
         OhIEVahWgEx9KxZGAbA2E0Lfww6cnLfMJOx3TnwVF1iwMxXY4y4RAwYiFI1dgsk93i44
         v84W8h3JNRoF3zQ52BTO1CrRGdMOI22V0GiBbJdla27fghyqq7EDJ1IZR/Zr+I8KPecH
         MpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3dtALaPCJdqZRMlZZXkb+T02WwonQG67w0QNxrtLtA=;
        fh=RuDiL0IvfOe7fXzXb4dwXwJd4S7v6wOLSMl6H5la2TU=;
        b=LSO4IwQC+4vWbs299ARbw6A9156fZ06WXsxyPzcOPfwFVeN1iEp4d4A+L1ofuB3WU0
         eWsJHQLHVMBnSFv0wqdp/2HCoIxkisIcrxIFEj+VDwnb2GdbScqNiMqcsWofBuWkRbqP
         71FHQJYpXeXDfI2nbpsRW6yBmwIwEPGHy1nsZFUxvoaK8UP76Mr7IYewXkxVC54vLioE
         YL7njeDIDc5eVbvWfCBOk+zIol+eStgahCm8WS6aCm3t0i4XlcgHRfwg8OxlGO9zPqOd
         1lCsA5IVch2slFB/nQVI6Gq3H5TlQxPnUo8U/7D2hkkd/uHvK+DtilWQ76bfPYJghHV4
         Py3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773381325; x=1773986125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3dtALaPCJdqZRMlZZXkb+T02WwonQG67w0QNxrtLtA=;
        b=Rh3jQZK/obQr8YER4y/qTMe3TJUp6ucaI7awTxi5K1viEofft3w3OUOKUZkvTXZVs0
         SzWDvPs2u3gie/J/BrzBZPJF0BpcUH02ai2OiRR6u5A0JlGv0xzlKSpGg6r8ONxUBWun
         DabGLqMqcPSw4iOSFefSfM4cerByCeIG0Hi1PNpOS6esSgq9g/ysGiqLs/KVj0JLFKML
         GnfoMuueK+lDEdTGniJzx7nKKggYYYJwV5KD1n8tu8qpqFQImxn0pHjrE/I5cEtxCHv5
         hLa9Mt2F1lBeV/gq2c27xCRwcI3+OE3otcdeYn4lpPePAl1vLg2b6qVRwAmbttqEB5e9
         Ev5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773381325; x=1773986125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3dtALaPCJdqZRMlZZXkb+T02WwonQG67w0QNxrtLtA=;
        b=CEy7dF27RlCSlDK4q2z2RQBpllxD0RcrN/ErA188WKt7hiYQmxPsYTzFHx30LfV4UE
         FeDGPtBy8wLTbePN6zf6uqZJ7M+nLZrESUU80YvrqYmE1Z+OfBnLcHvdY0yNu9oSiBCg
         uXuaJunYBH/oLIsPKTdB8m3c1w0VOmdO0MHu/nh3ZlX/JrKqSOUn+NPmBctq5sSoM18A
         MDJlNU4So8bxbZg4BrcHZwl/Ub5rbX8h5mxa/gBX/h7Pc9xWzR6Aisfk7hDh13ivANjz
         hksmpRy/c0mUSY5ZEGNuUwhDdh9MUQES9jT09+GsAtdmEVqm+pB5L09WWCtQy4TrSdog
         e6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3sadzNAiqYHMPUTW74eaHPDy3oohZJq/zg2nxgor1ffzjuUN1Rq1iKSbtk72R3lFxdStp0rxg4JS1cfzqGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA2Znvd6Oi0zwWbqNGM/QgYmD1Eu/LBWjAXUQFn1Pgg7Lq2LYj
	g+HhdoB6pgVk1FKowbrlg950QE0VHNRNYkc5i3doeN+KP5+RNqI70SFJpMOJSwxOs0TZWmkOuPc
	yCSFUNWd6ioxRUuj3L4Xma2Br5MczIdU=
X-Gm-Gg: ATEYQzyulB52FKihoDgcAQMV49iPIo72DKNl1MFU1EPsj+pHkQH1hnXNyTJdihlO/dz
	ux7l19J4dwb3mfwNXItGV0lD3O3CWnk7IM1lrfQYxhPio0e87lvHdFEh/GMmzDQRUgGnjk3O/by
	/1ZE1FdkzuXKSw0ii0p3KrVkN7JfEvJS6KI66Ih4Ez62Xan6NaXRrfhWXOvuymBzezuBVkdqP91
	J8Nvkm6J1XkYRLcT+vYD/TL/b+jrTqQitxjwqk5+wS6pMokPu6QiDECZ05wil02HU894SyBuRdB
	iUY43ZXmiu9NnUnMlTmpv4n58ubkv/x0+Plk6X3quN/qJRFqLylL8wxYrMaZXsi+aSULYiOI4os
	Hj7zHSC3nHOselDzu1ixWKA4=
X-Received: by 2002:a05:7300:fb88:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2bea55f6aa0mr586120eec.5.1773381325426; Thu, 12 Mar 2026
 22:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-13-alistair.francis@wdc.com> <20260303113642.00005774@huawei.com>
 <CAKmqyKMUT__C=4Lo5BhjB_QoaGHHNHQvxLmL4xuB54U=Rm0nzg@mail.gmail.com> <CANiq72npg6Cp8EfvP4H_PKhSaenq=hhOvV2VyMesc+rR3hB0DQ@mail.gmail.com>
In-Reply-To: <CANiq72npg6Cp8EfvP4H_PKhSaenq=hhOvV2VyMesc+rR3hB0DQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Mar 2026 06:55:12 +0100
X-Gm-Features: AaiRm52a5-VzSErmrex9Pp1KfSZdHDvErZcjdkaddKkUtEe4EM-b4sQJQOaYYa8
Message-ID: <CANiq72=eHZSUraTVvysu-24sUqUSakWwQ3Z0xcYTLHEV1hKpRw@mail.gmail.com>
Subject: Re: [RFC v3 12/27] lib: rspdm: Support SPDM get_version
To: Alistair Francis <alistair23@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, bhelgaas@google.com, lukas@wunner.de, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 6:53=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> We have `size_of`, `align_of` and so on in the prelude, so you can use
> those directly:
>
>   https://rust.docs.kernel.org/kernel/prelude/index.html

Sorry, I cut the quotes too much -- this was supposed to reply to the
`total_expected_size` part of the conversation.

Cheers,
Miguel
