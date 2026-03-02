Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2038A723
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461247; cv=pass; b=Kj+/Vvp1n/Ahw/BzWjpkPwQ78Essf1crlUv22sBNv0I2xX/nWLtKtARhIsG1/HvLuaLKdQKrKAVDUAb58+Nw4xvAFgnCtTJxq9uQWzg7qoyozFdMI3RYlXVUgRPlxXS+VnF0+/cYGVGy46RavL4rPKW+Qr3HsaOuLFkhsH3Utgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461247; c=relaxed/simple;
	bh=v1iJCitIlusxSvV0ZmYGh6EV90eFcXE9L9mACC4oXLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRJXKwInTG/dIFWctdncuBZ4F4ZQwldtH3eRhMBLWs3uxe5Bl8UEyktW7u00ldMsrWVeZmbCG28btGhyUXsBwYvgih9qCBEOQPWtrDhS6QyKwiPlj5VbRERbAKLLfyTfG5ydqxxSqQGeWzJmSZc/iZDLW1Ev9L9Fn0skqQENEdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODWTOi8d; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODWTOi8d"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-127337e3870so253956c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 06:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772461245; cv=none;
        d=google.com; s=arc-20240605;
        b=I89TDw0JdeXcZ+46vfJTH5oIrOLgGoK+BeUx53c7N5RTEq3xDc6fW0LGmrRYD98Jzj
         HmreYOjVBvqJ4Nmip2qtwXHYEV1Zidj/Pu4jzlk7FUkuRIK0UTZjXlc+1DAAvWMfrJeT
         78B+ZKEYbK3n2vD0es0AdzkqamXLRSimJoqKYtBEWF+ry3P+VhQKXpumD5iyJ7IYJrxN
         lGAuXXij/4+Sk2KSRXmjzhCj8yvgEIsPXfURDKhX4gqY+xWuAQOra4trXD2MmFrnnkzj
         bQ+zuOHF2WvolX2kPs3rRZh4AHmGnL2ODmX0rtGIub9XbuEahDDge/g+UOJUq13NejrE
         1iDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8dgdlnRXlNMes5eV5ld7vZ3X2CzhT0OJUL+NBisd6k=;
        fh=UUXCYqNtCs8tIbNjKpxqEvG20+B7FPPuxc2XlVZzPic=;
        b=AVpaStlWVa2jJi8mk7E9Yn+UxH1J+5Pxp9bX5AnKvXEirHtZy4zh3+vXPZVJY5mb0y
         2QABLFsli5Y3bRU8RHjmc3bL+LvOHlTKvaU7YX9nFnE5FLvn7Fa8tvUMLXjUyeep7yoC
         rV0C58dyfwwr039qqbtmBZ3TWz/vGg0FmmGhXx4OPFgo7Be9amZC8EIpnZQHSPVOdiRj
         Fc8GXXqcmaVwx4px+Phl2Kx4sXvVc3Q0f8k+I+Ln9ZKPLyILpmL+z/TV+UiV6CWDcAZ8
         cbN2f8XR14LhC1QydHgdyhX6iaW0Ye1V+4Pvwj6K6D2sVUeCJs5sY4ZuWvGy9rpNCv5i
         r4EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772461245; x=1773066045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8dgdlnRXlNMes5eV5ld7vZ3X2CzhT0OJUL+NBisd6k=;
        b=ODWTOi8djhSnmrTmzpyzAfTvKnr7So3zRqcluaI5l64R/lMyt8PJ1jyQg4GeBirKFR
         zBfxv2VQXsPvfFDXAV0/fBKDGVN459ceP1Xn/z1kNNGGEOyFN5GdjxWK58qEUk2j9rOX
         utzft21XNJfPNj+YWBPz6GiwBF7WevcmN+6CSFGUVw8VSsYPxaxR+wVbOgM7yGLYv/hS
         f1ZYF5ZMFcxX0v5aonQYHE7xYN0+owk7Ro6c0bBf5tATc1x89kdAY2Qt87hauSJfXnxL
         cpE1BZFrLed4oF4XHm6uXEUv/R+v72WVq9K+Xpfiw04/gG5L7hUi314HtocAvU4Xh/JX
         pt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461245; x=1773066045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8dgdlnRXlNMes5eV5ld7vZ3X2CzhT0OJUL+NBisd6k=;
        b=k7Qh50r1vK0f9duS8E2oC4/MFuixZJPbrrpcue+oo/VrpDuX59AtvWbG2ZedjcJJfY
         Exni1DFAEjL3PUnSl9mAWFrRAMSxqmGzLsFM4pKsJSeuXm+P3feyhWTs9pY6PVsjJApT
         CPepmJjwNbk0MO07mKibs4LDVZEoxDYOa8ayjz8dAYe7BCFxqfBe8rfHUCcaDA/xhx7h
         dedU3R9schBLfB2h9zm6bkLnFmxLOdbwNcpGraf2N/KtW3dI+7lFyVsT2h6idc1sg1UO
         DMF5bm9u4RJJcbjPiXsFCkpZha1p7SqJbW5+fmY9af37q6JSCa6SKFWppJjgABvT1Cxg
         rhyA==
X-Forwarded-Encrypted: i=1; AJvYcCVxs6GNAp1TslLqtQKLJukiiK9jSVfliMRKpa6zcuSkdvt6TnyjRdsjxzzFIUQJGUxK47UBYQzmrmZlb41TFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9u5oUz9Tuuu9ue8XOd2/Oi+egdkI4X1q94yUQF9K+8dfsdaG
	THfUY77Y8DvJbSHdEXyNjzNTnfV6K6WBMvK3VJi4QATA3TsacpiT6ky4EO4gT/Ti4/rAxaROZ+l
	NCdyhHP1YfbYMVa2g6mkDksE3lWI+Wz0=
X-Gm-Gg: ATEYQzzWIcd05d8PCN9r62CHOuDRTJn7lha1vPCoEzQQk4xFKPGMVLd+zg2At/Hy9Yo
	ZKDu4MZLkysyNGaNIGVub0/S+oon060BAdc9afKXG+TrdF6Oi2PEsQMPd3pDVVf6AGNWyN7ZMt+
	BR40PojXJ5IitonE7El19CCvUu9OgApOpUSwqjHOyQqQtUYWVGXSfyxF6TYaeZgYZMRac1k0csa
	PU6ItctDJxYuT9fxcldPiKeXo3U8a/TLYR0VZQn19S8ExLondIpRf2jLCltV7CbpHKmkaM4569C
	//eTIc7bnVcll4F1q/6IsyxTbjo7C86VnBAyUbm37qj3tGGH52NwUffY1XVMAheR/Y4FNcC2F9c
	QCds2yeXTbR4t8Y4+DIjpHGvbvegOx8YcnWCrP0g=
X-Received: by 2002:a05:7300:dc90:b0:2bd:d8e6:90a9 with SMTP id
 5a478bee46e88-2bde1cf8740mr2816706eec.3.1772461245499; Mon, 02 Mar 2026
 06:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org> <20260302140424.4097655-2-lossin@kernel.org>
 <DGSCXPXGW2SW.D8VR5QI5OVNT@garyguo.net>
In-Reply-To: <DGSCXPXGW2SW.D8VR5QI5OVNT@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Mar 2026 15:20:33 +0100
X-Gm-Features: AaiRm53KptjDkt8bfE05WqYGIUTryLO7FU3MhlZQUv_hDS9KcrKY5zr_tkTNAew
Message-ID: <CANiq72mWrPR32O-1rgs7fz0aJTS2rcjGMd7omwvr2cSQkM9rig@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: pin-init: internal: init: document
 load-bearing fact of field accessors
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, stable@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 3:14=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
>     Cc: stable@vger.kernel.org # 6.12.y and 6.6.y: need commit 42415d163e=
5d ("rust: pin-init: add references to previously initialized fields")

Yeah, something like that is what I would have probably written. The
docs seem to suggest a format like this:

  Cc: <stable@vger.kernel.org> # 6.6.y, 6.12.y: 42415d163e5d: rust:
pin-init: add references to previously initialized fields
  Cc: <stable@vger.kernel.org> # 6.6.y, 6.12.y, 6.18.y, 6.19.y

i.e. first the prerequisite, then a line without it to indicate "this commi=
t".

Cheers,
Miguel
