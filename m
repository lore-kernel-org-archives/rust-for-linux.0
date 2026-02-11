Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E24E34FF5E
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 22:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770848605; cv=pass; b=B+jUBf2Hr2iQlqJZCVnDl55W8MIwWab4qMeo86Qdk7GwWt92+j6MS2Mg92UzenaCxI4T3N1i04bvEEhMUHHt+g5yboUCTd+uzJAGFAoKSP+epL9jWySVqGK8eCKvBXfoGu9wjKEOwwX/eR6jAybMHNmwTo0jHR3XDBVkO6AOBJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770848605; c=relaxed/simple;
	bh=t7CmiueZQTFgB9OhTdQVtK4rAbqMocYVGmzF4dRfH2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPpY8qP8wkpn0UyEU0sgEFWGy8mVLcmKBm0BELckrRYZ2HSkwdYqBhMw8zhbCILnh3t2zLOxipTMk0cn1zDBqKLZJHxtgqaX8MdW8Rb/W4BFbC3DgVyv8pMpS6QdV+SJ900KzWovmRCyY4QoMpW0erMKrihdQGHP8ptIq+zagto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWrORt4Q; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWrORt4Q"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba9324f461so100848eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 14:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770848603; cv=none;
        d=google.com; s=arc-20240605;
        b=aoIUipZGsxXBDVe9T1zglNLcvAkS2TbnLQ2EPj2QD6alYIyzgxFL5mmh/T28TSB9Tp
         n/7fM/d2RmmD+NOG9HmgUVUxyri+zTDEk1jGXP8YVq9ki+bNlC7aHVClCcbJFQPaqPyb
         LGkeRYykZ+g3TkWKsZBB1OXB3BVAyj3tQRfz17WJOObWd7qA2ipYaHwW0JSn1JSJw0nF
         JoIq3SFPxLUQ1h2WSuLb56fL8LzRa41z9kbBY6CJzRlCwXdztv9nqFk3N3oHg+vJPapv
         VA3BdLDHsvi8aDR8qDXmB+K+VwlUzYq6us57DqnrxUAgf6bDYFiwnbDheWVCiNO4BjSP
         V6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        fh=J0PXLTp3boGKT3ZnbdMto4oSA3KexiMX2MQKD/YQ2sQ=;
        b=IeYWWRuFlrnB6xn+jf4MAe0o8WboHK3jmTRkvLVoAMj+tP1DCg9aBL/+tD11cwJTTG
         FmMAtMIoeYoz0zwiKfA1FImDrMd7leNuL/BrfWDz5fVrt6YV+YtujQhQtdPLtL4YfzSw
         fkaJYrApjfWkfzxcJTDmFvsip6UTae0BCmT97MmML4kZiaL/vYuyqVzegHuP10hpGj+o
         TYQUzVIikfRDBUD46+UPVi73yDQlltyO0PfFKHQJpV+2+MgUpPlWzNPgv5KNd8p2ykO1
         9Lqi4r0S80t8l9ci2yVKTOJuYOA2uFuov1S5EEa1uL1MzTP7HdP/hDaywoy4953sANLE
         Y0Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770848603; x=1771453403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        b=SWrORt4QrOulv6xL4I9BweGhu70T4bELABwNlzWH1KQb7Ba8Ae6ECEEnvKRThz2Nsr
         dmLHJ45TOhU98AxjedzV7uOQ4MqYPKqZHp9sliA2TR8wfdJZtCr8alirRrcDAW41kOdE
         j+qUfc+PhaIOF8J5nWUhBpXJ7xn3HU0YHZz6O3C4sheh3791V11t9cUcBS8zCoLkD/ND
         0naZQJNNf659jHl03ly8l0LuJYZIeUAkQyTNyvWgb1JiLT+VgW9ButkNtQtcwnxmBQFH
         7Qzawz5H7xUGGG2jdSW5ApVs7WglM8Rx+i6e2DdGNtso035NHkU4l/I2V0t4rY7RQkoZ
         KeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770848603; x=1771453403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        b=re/YxCzyKhIn0AgZWJU/UqmTh50whyyhebLpkOL7OiAGyOVGiANOYTUlSHyhLHjwwX
         bFVRVmJWmrQRLNq94sydliHWb3A3ZZfU+Jo0dWnurLMiqwjIKJS9qOGPqkZlXtQ/O4C6
         y9qp13TVA/I/jDO+U1WJ+4y95xCkzAzvXVdvMYu6Qp2USofGfTgxsE433p3iH10nErK5
         2rUrXeUIpEeWh/dz9o0LDiFJHr9uJ4UVRSrpIs3CBLDzTb5on5pVn54koV9JA8fpfI5g
         D6i/4eILPFzkPJoQFmMaM0DpgDW9TqAzRZXwry/y07/P+JeEQG9kYde61O/8/3f10yMW
         S8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXCYd4EydvfacZHWMntg8zAm57Oe6jQjmSOZ5d0B8VmKrczvb7mz2rXLlpvsXsfNpvwVrxUSkr9F4FQGJbfTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1YbsaOy38ntGZFB6tDzmX4z1OzAZCrdAAoYVwthw9cbnfzaDx
	bhNR94HsZ0/XrmX+w84L3EjlrLGjdRleov+LIgx5nF4oBOgK2TCRHWLTKiAFekVTKMe8aUbh9Ja
	UIfCfGA44nP9UnHiYMvXlbcal4lw/7dk=
X-Gm-Gg: AZuq6aKp4x9NYsQbVGtPN9fTkBwT5ZPiuqrYnus8kR8hsdP64ZPoGMs0DNM41DijdhM
	Zf8N2aBx9QqXXwyIZW1OFzQpAmscv9s8p4ErB4TDll1tdWS/I5vx0KKcwTcuvVIp8k+BuL5Gi1G
	CxggltDGkkP4w1dClzXSAH8qrThe9I+JGxVKMCsPx6QO65p0LepR6LaUHtfpNnxQJTiIU1pyNMC
	UkJwiT/spI4ZkXXjRCtygsDi3Eh7NaRaqAU5rHne/EJXDMdITUC6kUELQTzTUtUKxkFJuY8zUYx
	QnIynsgcLtpy6/L8+Ulikfbsq3Kmnr5g+u8iAY+npowQMhF/fJi5sYDpfzApLVAHcd6sUfUfIK9
	DwxB8tugT/ZiRp+7mgEstWmfi
X-Received: by 2002:a05:7300:cb0f:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2baa8079874mr215051eec.4.1770848603104; Wed, 11 Feb 2026
 14:23:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com> <20260205200222.GA1298159@ax162>
In-Reply-To: <20260205200222.GA1298159@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 23:23:08 +0100
X-Gm-Features: AZwV_QiUruFZTWSfo62Op58oUYH2ayIoiaQzk5z1Tco-BdUXIDPQzuMLaoXlnas
Message-ID: <CANiq72=-8urJufUuZLnRtm6qKCUhsSd=kPF=_a3ga=nk-iMV5A@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 9:02=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Thanks for the CC, I had not seen that issue. LLVM 22 is currently in
> the -rc phase and I see that the fix has been merged into the
> release/22.x branch as of yesterday so it should be in LLVM 21.1.0-rc3
> when it get released on February 10. LLVM 21.1.8 was the last release of
> the 21.x series (hard to keep up with all the numbers...) and it sounds
> like this is only a regression from the LLVM 22 development cycle.

Fixed as well for Rust 1.95.0 (expected 2026-04-16) when using the
LLVM they provide.

  https://github.com/rust-lang/rust/pull/152428

Cheers,
Miguel
