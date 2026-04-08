Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26BD2C026F
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639518; cv=pass; b=rqjYA2pPmF6V/ykn82gjGdMPVYRp9UdPoVVIzSZpSGIrBAGCFUxxDdA3HAO/QFetnG7U2VGQ662usbbXjVmNh4lPl+Sba48Ywz7cuGLg31Xlvp8BvL0BBDYMPcNwnskG83Z+jSdFSgoQSbLJErrg3g+1zo6rqBY/kE3TDdE+YXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639518; c=relaxed/simple;
	bh=oseMJlV+hRLmkJdm4LrYGO/6hRHzOSonK+LJPkMrfaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjyIm4VCkJVycCYt4vuVPKWDfCjDX/7NbmngDCfwxfX3O/demOmATBK+6gAp5R8eMLDOoKa0bUh2OMhBgOD9MtUKX3RMwNjoJ4sqw9qxBcDq5Vs/VZZ262vm7kcmZqIA1Qp7CDBgfBWgohCSQFzoTjnqUNavSctsa6avJ2WbZps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKzVUXl9; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKzVUXl9"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2cc43ca447aso210856eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 02:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775639516; cv=none;
        d=google.com; s=arc-20240605;
        b=fDTUVqzc+kSvP77Sqjzsq28Mhf2Hk/9OfzdnzwVrbF7fjiAHP2aJndmI0B3zFe/epP
         MzNpHxGyH4fMhGtBk2CZtQ2y0nFKeznZRO0Q8b3nU745si7hT0qG89xeifko+wYaUNQB
         TJPkm06W3VHsff/xx5MCF2EnvU7c/ya9roaGqROUGVu/FPIQ/F+jqYnOqP7NmRYNsCYn
         QKZw8LBAA+pyaIL2ddtfeP05P+Djq3EcChLUzkZ02vecSTXuSSrPi0PnyINS7dba/1R/
         jgtQ2/hHW1vb1muFMgDiRd8ne2kQad+MwusP145+TenYdd/Govabbi0WXJH5nbVmtioG
         m2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oseMJlV+hRLmkJdm4LrYGO/6hRHzOSonK+LJPkMrfaQ=;
        fh=iupYtRuaUmv33s2Yr+VI+Cee3AUsE9ypiCvaY943jd4=;
        b=AzMDTnrDzO/MamZU+3ZKLAD79txmIFN91FqTyreYqi+Vg54f/ZRLa3wdKGU+q2hHMP
         uYTdLYUv6JLhhvcVpWRpr96SkhD5z72cLJRcRNbgGxzPpNF/SFWKN6Xn9QTIIAsqNQXD
         L7BfjgBNdoM98N4myoYbBO481fHepImYJxLAUo4dt8g5nPUpRsS7XRqGtddhMAHLKX4m
         Xgz/V5Ja/mYHkSJPSp2t0DIgs8/JXutddPKnI8/7AD29cZ4U39N+MSdj5fx64WRvX8t5
         Ro/xxiIAYYqorD9ZP+402wBKV5Ys4YTQtfyxXH33v1JjC1nizC72B9SsqcfgiMgGqRbZ
         lJ7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775639516; x=1776244316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oseMJlV+hRLmkJdm4LrYGO/6hRHzOSonK+LJPkMrfaQ=;
        b=jKzVUXl9+N26NjuSPyh49ciDdUOcShYJCucO93Ppl2kVk5mWpthOuowzHI/aFMZKyZ
         2N8ux+RTI/jd2NgldTaCtDLlzo01BNEBEL9ZGrlXm/fcgftHt+olXAIPOG/vs57vu5D9
         HKIEFhoYFafO5vTYf1g+g7blqL01lZNoJQ4F8SgjC8rEmUEQQrYs43jE4ky74be6NH0w
         LdCqGjj22rz8bqX7fVyiiY0tNwzXBDplSA9w+Ycsiqd17gJv5IYXsgKwvzreI3bAf+dc
         73ELQuqsYYEcpMJE/eOl36jTnAJ4wO/2zZkqAyG1ukb+QJWlW6Tzr0nvAY931BWHXASe
         aCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639516; x=1776244316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oseMJlV+hRLmkJdm4LrYGO/6hRHzOSonK+LJPkMrfaQ=;
        b=falFvboZSXT3XlzUDH1NI6XDdgZzQdPZcc8ZGFGZ5BT5A+F15cPD2UhWGluh8h/cN0
         ubWPLlhKnw78TnjsPzr0at+y7C3gsZmQ+FawKOxMusP2rObKfqMGuUxEoMw03rceq/Nm
         LX63a3sCYq2vClC8tDgWCZxWwkohCqOWnSacZKnmJAIHaG86rlJl5dX6c1szPnYfeJy+
         hVLX5XkDchzZXaJRHU5FKWl4REz5kt9Doq5cYBJWE6wj7gglm6lM2vdYAAuv82AgtAYc
         Xmm+fj4ZV8+lNRDX4QrkcAP6GTB2ovAtPuUSmo/FFx9S/R9gApYjTuXw1G37rKoD0NjE
         JOnA==
X-Forwarded-Encrypted: i=1; AJvYcCUeEDc5HC5xVN+L54C2wFpl9D5V1TWstSVOvI9kJUHjdObLKHDASXrd1sv4AC7xqwH/eHIPBiYzCY7P/1Saog==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwv/0dW6aJnme45HTaG4TGThRCCp/3s0zxeIecfpqJi4VZCZBz
	Zln2RZRcFmje+pawCOnhbB7EgAyK2Wye/HGSsdj+Z+v85w1atARQ4A3FhPUebuCGlmUa+kxHWlV
	Tz8AMdpa9Me8a12uaF4dor2MvTpq7oWc=
X-Gm-Gg: AeBDieu+looF4cRsGKBzqGZ1MvNc69sK9igZB5LKebO6muVJqK8Ya+dVjeJVqSrsldu
	nsN22718av/lwcHg7b01WgIV5eEKLYhSJZCNA/kPrtHjZpsRCVXQhiu1dPJXZkqN/ZlCDbkfIg+
	kj31pSNMOQyZNo+GETme+TFZITCyqc49BLrDRTv7z5aGfPwhfEg/Ejc9YPI6ErajbFiZqhSCIBl
	mU32keerafQ32jizf0cg6J6T1Dn5tEdVFb9J1nbXkSacspV37i5w3HF0Vo/PFpTvEjF3oNZuQuJ
	svDP7sNqgfbTI3tkEdJM9c9Kj7WQrQ/bYktKChtEO8bPh4esCNMRuBN7Y7yD0NvpffJ9GamTq6p
	xuttiaNn5kZpeq6YUEhxYNr0=
X-Received: by 2002:a05:7300:a506:b0:2c6:7f49:a86b with SMTP id
 5a478bee46e88-2cbf9aeed98mr4591033eec.1.1775639515820; Wed, 08 Apr 2026
 02:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331131729.1104236-1-lossin@kernel.org>
In-Reply-To: <20260331131729.1104236-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Apr 2026 11:11:41 +0200
X-Gm-Features: AQROBzDeKYQebT7-opjAHsAc5bkK_AcikSllaB5SqUYtyoyxOc0c4FuKM7dwZ0A
Message-ID: <CANiq72nNomvYoNLAxfMSKaJ-3j1ubmb6HOAUUwbKMbpEfdwjLg@mail.gmail.com>
Subject: Re: [GIT PULL] Rust pin-init for v7.1
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Antonio Hickey <contact@antoniohickey.com>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Oleksandr Babak <alexanderbabak@proton.me>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 3:17=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Please pull for v7.1 -- thanks!

Merged into `rust-next` -- thanks!

As discussed offline, this counts as a back merge, so let's avoid it
in the future unless justified. This time around, I merged Andreas'
first (which was also a back merge, with an even newer base) and
provided context there, so that this one would look like a "normal"
one.

Cheers,
Miguel
