Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F2F2FC893
	for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 20:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778963731; cv=pass; b=Z0kMT+QnNhp94jtTC7DFxtoq2rby6Ngctuyz7Ku5wlektKyPGfggkB2fgjKDkqgb2ULQSkvQh7m96i5eVee4x5HpJukqR2WTo/F4RJzyf9d0AG2agKnXj5blf6FO/F1kEw0DmV2+MHB53pmDMyhg9ELGzEdwmD0EGlrIjV6njzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778963731; c=relaxed/simple;
	bh=BPzaDMTJ4FMFviJYoFNi5cUlUPTXvCN6U7hIvDbkvpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nyoAOVn8UTtitlLTvIqjw/t9jMsEkt7UUtD7RtK0TkPtpefKJWAIXtvVUrE77CXtHPNiWRJiR+D6/GzQJCMqo3QFGIUdrXq/DUb5S3Y1tnMJ1QQ7YIcZa/XRzlYZaIkM/Qg0ITeF7Mbc5DQ/e1rB9+RBAbJAb7G9nRh4BlkP4Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6roq2Fd; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6roq2Fd"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f114d129c0so46431eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 13:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778963730; cv=none;
        d=google.com; s=arc-20240605;
        b=SsPGWN7Bvtt/YAW7iiP6rLfcPgl/C+7vhwXF7WOSCqxvI/AAp/pgDDJFJvQc7ryLbF
         W105Rm6fZkYlJeO7k4j4raRWpsWPMbnM678mRWgfMJ6EFPRQM/3tg0VxOAfpjC1snA7g
         mAa0xoLFdIOgOSXc3asklnz7Iiq7LD19xjjiJYJceY8d3QrXZumtUi6+HP6Ww26tArio
         Eg3svBKo4n+syw37HgF2wnxxnfj2/TGfvp9P77KDSidY4BO3lwA9tIXXlB/R80CrfqWM
         9AGF/C37ycPfnd+yihFEH6mJvKMX+sxLmQlY7iuEaBMehgm1fikbvL1NGGWD1tRtRL26
         IzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BPzaDMTJ4FMFviJYoFNi5cUlUPTXvCN6U7hIvDbkvpU=;
        fh=DLNRQNSKrr7FtS2fWLi31m1K7pdsPn7jLawqJw5vYoI=;
        b=FjgT2s3Qa8Ykm5GLUXa5RBCDb1vCLaQuIyQ3i3K0muSejs0Dij4u8NT+2pVeoNuXrs
         ePmHHo30CODG369eAQgL5rinDrqJcmQZ6yOXLx8UP8bFwm9KalVS4gFBMkC6WPlVZVSw
         vcp95R/toGzCFMmD9bAz0hyVlZdNAJgEkphNHlx262lyY1MNI1xfVZCMNP/xaGg6r68O
         fS9DIs+nVD6VJGpKbKejnYzj/lqNV0MBRuLT9pnjTMWkpmTEqv/LZObTMnP5L9eXFf/u
         t5Trfq1SCsugfAXX+QGcCR++gNF0ndTmdD8yFBbF6NfIohyhR4p+UCDjR1ps5OubGzKR
         dIBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778963730; x=1779568530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPzaDMTJ4FMFviJYoFNi5cUlUPTXvCN6U7hIvDbkvpU=;
        b=H6roq2FdZZgR6PL07+etqmp55hQjJxKEOIijy1gpRO9dMXuhsdMriSut25d5PxeQO8
         YBpF2fIIEUdnhFEGEf7r9W23aYldizUH2e8S46w+gKATsfuV8TS+nqJlp27Ho3ZQHgFG
         gd3zaTxZ1S0O5q1IZE/527ekp5o1DHj7vY2BSbhanZdRs2UyrPeuwnbAKBOrND/lFRSq
         jXzXw/BKR6i64Or9sYEjCv4C4oQtds7/HpR/7lVPu2bp4ZNZvpWVHjVjZT6qPa3T3is2
         qq0bYsDtMC5ZCQDWO5YpbO6PatCyqZRhTbbE/F3H96C31G165rZ3u2dUj/OJPGxV1+jL
         d36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778963730; x=1779568530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPzaDMTJ4FMFviJYoFNi5cUlUPTXvCN6U7hIvDbkvpU=;
        b=rHAM6GA0UdT5hdmk0IlrgKAleja6MsJAHKSgWUyWF7w9HcMbM43iiODdGwyQfbZnm8
         fBTF5Cx1slZeM594WKbNsT0nsN4WKvd2D9jVLyVm0TegkmPuRNjrAhu9r88hFrg829w2
         7XB5MS/S86MJ89/K8X/BOKCQhCqjttkdpvzYS73AI9W8sJqVo5g0IUd6lKXFHh3K70CO
         WwCEAo61buE+nArGFN7sMGindWlJXJhVTah0z2JxjBAZonMhR1LDF4dJIJ5BglFzeAgN
         YrGBlTCjcnKnpdeSV21IvWptr9g9iGYLlvY68oAhTIrDxzjW3Cy+v+9BSH0yn9DBvKpe
         md6g==
X-Forwarded-Encrypted: i=1; AFNElJ9gmzRGNi/Rxwp3q1W0d4TkxzTiA9NTOTj2xTMSeqjKE3NNsKS6XBNRQuSSWfG3HimzLLoW3X7neP86l4SZow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxymniy6COCVcJWPnCm97Pn7bs8yK8aeRZaQBH0p+E4IPPjUgBy
	QziuiLGk/v+D0ZniekIPmh0Pe5DfZ+CHFJgU0afa99r2MpOy1xUsJop3RuXqEvWVau+UMVL6BQX
	e6JHgTxzorbSMmetoilZJe5SeD3Z9nbk=
X-Gm-Gg: Acq92OENoS3RTG03x+gcrSkeF5V2W0fhZ+9tpmfPSLWNXamygwG0A2Ia/cN9a+8iDKA
	g3Mz25XSZ1CUXRFDt8YceEFSIw/+4qk+qXlEccl26GQwUX3JcDwDE4tyi5Q1LNJ7pz8xIquMrna
	Tbwy7Kf6nn1nLM/9282HpSPgyPiBhLJIBGdDdXkcU0+sStyrzkjEbuypDVzD+chIzPkDhoTEZW3
	IzefZJUm8UmESfP8l6WbsI2FbKOUunuTimvlpMAnwaXf5hKF9BQfTP9q965sfTxnXFbuIp1u6NM
	lF2HavZOqNudiavo0VpIyNW7GgfXx1kcTrJDVvwOhXFQYYlkLvbVvYNfYrEGi/FOGLtZ8LsSC1D
	L2V+vcjdR8IhWhyeqHLYu/j0=
X-Received: by 2002:a05:7301:644b:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-30398652434mr2017744eec.5.1778963729561; Sat, 16 May 2026
 13:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514150957.3501924-1-beata.michalska@arm.com>
In-Reply-To: <20260514150957.3501924-1-beata.michalska@arm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 May 2026 22:35:16 +0200
X-Gm-Features: AVHnY4KpNKN-noX8erOoZUiIm6VUAJi1ESwJPjMqr1-JwtwRZb1wnwHRagz7hhA
Message-ID: <CANiq72kQ5=4-5whthbyTZ1VrdwHoZjUOKY8h3MCTRFUymBKD1A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Rust: add runtime PM support
To: Beata Michalska <beata.michalska@arm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 5:10=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> This series adds initial runtime PM support for Rust drivers.

Cc'ing the linux-pm list as well.

Cheers,
Miguel
