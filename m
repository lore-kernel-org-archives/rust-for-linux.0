Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E62F3620
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 21:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769377301; cv=pass; b=hYD8iXkJRnskxLRAJMOWA7/V833oSevmYXrNLUSbwininoY9OMypa/npnRoHfHT113DEluxXGmuz4XP4CotZIsz+sp9Erqi3zNLrj4TKghv1fFC7okvfPcKJf/qnwgFdfrmUrIw3RWwvHQtYqiEWGW5N/7OnMJu6HGomoDbp75U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769377301; c=relaxed/simple;
	bh=CUJyJdkPJFr+qzK/2iHOhlqvG4D2dajcsiQFu5TyavI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggKbaVcr1JtRz24ShP21NomU/FYneLHMQs9OcTNdEVyX8m5tfPOLnJTlRleSbaAY5R1R3nEWiExwSunkAnB9iPvjAixWgYt5EfpICBOa/h18H+X0ueKjmVO95o9IPyex9sxoXB+TN85l5m07V73/d7hfSyROiOKdBCCrMiy99kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz+GZocd; arc=pass smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz+GZocd"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c5320536bfso471414685a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 13:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769377299; cv=none;
        d=google.com; s=arc-20240605;
        b=hf4zQ5BbNP6HpyLAoa5HByXozAu0f6r7/05FZelY7ymVFSZiJmBpz8o4d5h9PwQuVi
         P3Sr3rsVi3BQ1m2lz5LWDfbkI19wleJnoaQGhzctW9qofzLZuhpJQGZEpSesC/pVGW3f
         SPwWJKYXEyNMYY8tLe+0WA1a7FX6zT4wah6bhZWuZTOVIrWWTz2yhCIXKfR/x+cmdNUY
         ZTUwesDoZFCa93BxpMhxxeiy11PtqxrHLzr70BzT4/oM0ZgpR5VGQqAZ4oP5FISaSV9p
         +r21cKjvX0aqfgTDTguKG8/h4EHvNbuueU6UXwBin0XbJZlLhYyJw0trzTrCal2q3oK9
         ZSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        fh=vBC6gynl0VSr8h/r/V2qnMrqOUqJbiusqvtW46ymBag=;
        b=MFvpfxQI4u+nWYDJUJ6SEvvOD6s3/0UR4m81KqLWS4wrufsXFQTmRwngvsZLXAi9Ox
         w7OaXlGmUlKo6QqtqeAQjWAfYyC2scFm0R0fA1kVLr18BVfa4KMteMFb37bjZI/wp4bX
         ewg2TmBjWObBHRE+b5HiBJdgvGUpJGsF+6UddKt2pXR9mNIijTiWF1ZMrQJvWBGZj/ap
         4ezBBSZjtjEpu/v2JvaLxPfwemcQyqHBH5qXPLLh0aBmOcUgaih0POSUSvFOmnkHYfk1
         ymXfDg0lm9J7DDzgthc2u3wMw8FMRxvFnW6ohOH67+uNz4Su6S6j7VSNAVVUhVtfiCAN
         IuvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769377299; x=1769982099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        b=Oz+GZocdZ0Wkk/cWMts6zOjcPWNmBO5xBBM9MOAwkiL1mH2ctv6qa3qtIHxXnWvYGX
         lQ8OnZnlMGYjJWA90QJKpFuAT9rw0GsMa/WUTGhmu6yE1E7H5Slv20GaS8ZnQoWHupMD
         JQWUO/HXy06Zdxxm4VymK/bnQQsX3W31TIrldyq3srQz8pcdu9gej0eBM/oYu7O941U9
         Hpw+b0tUh1Ihin3b+KxVEx+kMfe0SDAiBHI5uoylKZc8kg/422lkrzxP+TI1CuawY5wc
         bAmf2xAGtxK868EgTSD8ppKj58OMWiWUHHYDJy+gbkNbS2lScgllC9xF9IVK792LJo2q
         6ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769377299; x=1769982099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        b=u4+j3LBSLxod0zmlMe5AuBsMnFL5gVHR9APEyHkZqU8dzB3Q3D9O8GbzGkh72Lf/oE
         B0iKV1jrKZwy29V5ckN3uyw0ohOiS4URtlIYzz8i2NI6kGsjNgdVsC3l8VU7gWT84PU9
         Atec5KdS9qoauLLqHT4N2b21FHdRz41UmFdw+/8wLU+I9MQ/Hz2JNeKnO3UMUdXePPav
         UBrLHerGN/ib9w/BY8VAviW6Q8hpyGndgKt7R1lyy23roa+JuvB/vfO5Z3lX9lY1OWp4
         UIHI8jsRU0l73nkGVhqYHa+pczVt5HUaFBvH+LvV5WhSdiEbLSefoG63ExI37XTW9rPV
         bPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqMy6X8owxlkxEmTV6uUXYcSBPVwkafwfgqkM20wspOE0NH/Vfph0sq0bdHVjeZ3TpPYiNWxEz+bjM8D62Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjDxWzOm5hcf8EmEKE2wqjCfVu4bYPISropvzKmqausLygfbE
	+YbIdGM+SzLeqp9izLxM0Rn2CIBAvU8axQDkHGsQct6nxBAnQ3H7IrWSawD9W7NQQ6Pbns7ewiO
	he1GvnbBMGfpxrMRMndV+w2lDy5i2Gyw=
X-Gm-Gg: AZuq6aIU8fhNhaHF8toOz5k6tvKRCVm1QtRXgs3hPU0D1N9mK4B1+vCKa8ZRdH+DKZj
	Z1Pl2ePLugl7CKQSNpJh3RcSC966oD/kfbmpYQHTBLOea+pIZkjoM/nZ21l0+efrrkO78fdG5rv
	WTs+qnvpGuvHIwUpR5hb/Y85ik8VlqaCG+j/fFIALWig8mxJ028L11M1qUSHi99umZWKoq87mLP
	BhumTBam7lJrMtdZ6TTGAhVsfIC1njbfsP+w0WA5bMTU3XsWel077gERek+tQlc42PCr7CtHxVr
	rcjdpkht4mylon8FIMtVOHa3D+hpOCnrrxtYYCGtuRBu6BaEkk0H0+2pXpoD
X-Received: by 2002:a05:620a:172a:b0:8c6:ac96:f5e5 with SMTP id
 af79cd13be357-8c6f96e6cdemr280705485a.83.1769377299320; Sun, 25 Jan 2026
 13:41:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADkSEUjyXH74izTrsfhdAjh=n-jnGx=tXbqPx86M9OYqjXj0PA@mail.gmail.com>
 <20260125181125.GA209392@bhelgaas>
In-Reply-To: <20260125181125.GA209392@bhelgaas>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 25 Jan 2026 13:41:28 -0800
X-Gm-Features: AZwV_QjfdD5BNg849bWJiQdew-9LUzyZdNbSnd1c07lERk8YVDkD-hDCRqejbYg
Message-ID: <CADkSEUiwQTq=175VZ7Trm4Mf2o7_ckcAkPouoawC5s4oumdcdQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Huacai Chen <chenhuacai@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, Takashi Iwai <tiwai@suse.de>, 
	Eric Biggers <ebiggers@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Dong Yibo <dong100@mucse.com>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 10:11=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> What is the value in removing the IDs?
>
> The values can never be reused for new hardware, so removal doesn't
> make room for anything in the future.  Unlike the removal of driver
> code, removing the IDs doesn't reduce complexity or improve
> readability or maintainability.

Understood. I'll send an updated patch which retains the device IDs.
