Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C9378823
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 21:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882056; cv=pass; b=Rx/xIY3NHI7HR3rfahllYe9OSNDM8jqmSCEJcXRyhgKnwnTGVtuaxt1I6eTM0EzOwaRYrLfPq1B4JwztA2pcyXkjMbJaulddY9dffQ7CYpsEHNYTNCKMD5/WuJOSAUY7k2oXR9CBYw3BW3Lt7G3yjxCWYux4Red1i20Nl7Ua93A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882056; c=relaxed/simple;
	bh=didkkmMeA554Dxj/ZdCbtum+QUKQIqmhPv1W1r9HzYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9AUfmbrzNvBXka4iNIHG0siCDqpAv7Zd38LAL03/XWhkUQgp4ukG+DbKrkzowNsH/hqWlt4DfMY5bZLf0bWO/3w+YKygtHBsZj8oyl0nczv9kOh6Qx6az2Kg5CqaBXIDJXCPhD2cxxTwJM8ypg84QDcv1p7ptVHhA0itrvJ8+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DZSyS0ri; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DZSyS0ri"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4376de3f128so3439175f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 13:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771882053; cv=none;
        d=google.com; s=arc-20240605;
        b=PCniAmaYmFibTrn6L8gZkNA+4Zc2m/EuCgOoLTqH4TuXFAbWNN4WMp15sHHAuWjoIH
         2LahxL9HsSrnkYda16wLwXZwq0SeLMd1LYGdcyERCfDfC0WH38HchTqgysSdzHiX4+9n
         51HjRldUmv2+zedOGNjBtGg6yCimOLeWiahFfn3NJIMDlHBWOzhTPvODPWmwBycMvjq5
         u44+Bxs/CTL7ln4R5o+aYK7icUl9jkxGkZWrqrz12Quqr3QT+4pi6DMJM9lkXYlFCGaV
         NGN5m5ZQvjg4ShQvx6U37kYqJdbjoVLIeYpJ5dwCZ2/0MURCNuTDAO+PLvRb39xQ1WlL
         OtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TLtkDhp5yvjNfBzirqBO5/FyIhc8TMr7bRoRTvtMt0=;
        fh=TGk0ErGCUxdL2bpE2Bb4FRukAjkqP4TtdX+xroh86ps=;
        b=hdlcgCdQcdMjK7XBUN/vih3ER8BjI/Cjq5GyEWRMLXmE80xsvGs5IB521dW+S7Sx+B
         EXDMSbJTE8+lzD8S9LODQpWTEklGEPBOq/6cQu39RZL3dlwcaSTgLQNLaYgfXU9kjqxh
         D5H9xqHmtUXm+fa8A9IxqpZ9sQtNRHxIsRA3RyUAJ4vbvmUlSs0XsNngMKc7teyJf5fu
         qVp+PeLJYh3Gwl+nQavskjFFAyiVUAAKmZ4cS9QLE2q7eliGCR/gNNHidaf3ZhoNcfOv
         xvM8chuaFG9CkrDgVYn/JM43vEwz18FTFfSZ82T5TTtb1K7J2pBCMN2GlBE1S5ir7qFm
         c4NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771882053; x=1772486853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TLtkDhp5yvjNfBzirqBO5/FyIhc8TMr7bRoRTvtMt0=;
        b=DZSyS0riRLv6DfivVmna1TefOP8SBQFJcVmvfN2qZaiD21+nhCtRJxgr6DIoVKg7Fd
         nfynEr3YXUqQKAzAmZBB7vfSjrS6vkqRR4tzjHZaf26TgjYhimkEYamQ6do/vqUBUnBl
         I0gTPdDAqvP1Og7QhMhS/L7t8jQGg0yMBzy7hNC7ifXW06I7Ot8vYrB4b9WAb1aYArw4
         eGc0WG6uyjWoCS7c1TDXvR32ccsHAn0Ymzfq6WsYn7ZRBjEsPCoVhhewPh8BLn6+AA5Q
         mrhpgErqGXJ3avnvCpYerMFSIDJrOxiQeva9KtcV57GN455J+11Ws8DccSEMGS9ZGbq0
         3QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771882053; x=1772486853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TLtkDhp5yvjNfBzirqBO5/FyIhc8TMr7bRoRTvtMt0=;
        b=bTqfRhnQNa6yCSr4h+Gu2GCbLDDmdADqdivfHWwJhOtV5/gV0kZVxxJmAuwKcoHtVj
         03OZU9hd+rarDInkdfEcx6Y2hAkLAtkQ9mt1sTo187sf8UlLkmu3vtZoqMGeTsWq24dJ
         U5nzTiksSCUlZw9mRPm4bc1mnO8eHDJfyY2GZfBNevALRiiCcWxsPw2Dt2JNaUKVQcmS
         j33OGW4s05V71NWP9N/n0RrI2XStYAJ/NGchIzX+7tMqiK7Kn0RAk6iX1+00H8+tFZdb
         WYHAXaKh+FCFw0A0s0k4R2Fg/VZwiW3hDnWkQaqo0sTV9qjUpzaiZ61eFg616rMLt8mY
         NFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4cWJlVBwPPnli+lhqdp1jqmZkYpHyvpSoumTXkkjVlq+b1XKDJKgULCV8I+1X7lASJPPcPwXnsOE8Ay9xpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyENWs49l2DbbAYrMY+pElHoChD+zbDY4Irfn688yBQnhbqyQxH
	JHIQcDaCZDmz4GwAVyWuqT+E8LyiD23fjawgkG4Sb8g2NeiEo6rYYcRvoBpOmZW5DDcVm9poQKT
	wttxte/DRa+N7i10L3yIYBQVUMdBJ5QkP9aeEVrCa
X-Gm-Gg: ATEYQzxo7Q2x9UffxQmvv/NV3fwq7fxSHiBFKatfNTVt4rbriIqWQGOkmCFcsMxMe8D
	DAEtzhJ/QRCTNMaZ0hdvFx9aL7PpKGqEjmrnIBu9PCMJoaTEyCPtkWcj2uIIrGCyS623lOcvCTo
	apa3M4MDOkyCHki7NCYmgCPFIFYZ7++3bNuYXjccP2Q3l5ATWjtpsV+6cvUBO8LylsEjJSX7/1w
	NasV0/I1BQTfI+3XiKSnEZyWBumYYlRFa9PQEXKXdCGJodxBObC+ahNBS0ASRkWe2g7zu5+xKC5
	N9ugxy8sjSjgH/80plfW4eDwRwlwZ/pVdlqc2Q==
X-Received: by 2002:a05:6000:26c2:b0:435:a8e7:62de with SMTP id
 ffacd0b85a97d-4396f18f942mr16385137f8f.58.1771882053091; Mon, 23 Feb 2026
 13:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216131534.65008-1-dakr@kernel.org> <aZMaFhvZWiknu8UK@google.com>
 <DGGF97AAA3HF.3DSNMFJTCNI9Z@kernel.org>
In-Reply-To: <DGGF97AAA3HF.3DSNMFJTCNI9Z@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Feb 2026 22:27:21 +0100
X-Gm-Features: AaiRm51eKGoP_MuYqn_kp-y0-YSen_uHZo47Hlce9OFpI8_rE8a7FBFjXKSXZpk
Message-ID: <CAH5fLgh6MvjN3AHCVUROeYFWr+0CPxoYcgFfa99wu1EaNJAn-g@mail.gmail.com>
Subject: Re: [PATCH] rust: io: macro_export io_define_read!() and io_define_write!()
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, bhelgaas@google.com, kwilczynski@kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, zhiw@nvidia.com, acourbot@nvidia.com, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 2:31=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Feb 16, 2026 at 2:22 PM CET, Alice Ryhl wrote:
> > You should keep these re-exports (as full `pub`) so that they can be
> > accessed from kernel::io. Exposing all macros from crate root via
> > #[macro_export] is legacy approach.
>
> Good catch!
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 58f464cf5efd..e5fba6bf6db0 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -249,6 +249,7 @@ macro_rules! io_define_read {
>          }
>      };
>  }
> +pub use io_define_read;
>
>  /// Generates an accessor method for writing to an I/O backend.
>  ///
> @@ -305,6 +306,7 @@ macro_rules! io_define_write {
>          }
>      };
>  }
> +pub use io_define_write;
>
>  /// Checks whether an access of type `U` at the given `offset`
>  /// is valid within this region.
> diff --git a/rust/kernel/pci/io.rs b/rust/kernel/pci/io.rs
> index 2c8d7d00e54d..fb6edab2aea7 100644
> --- a/rust/kernel/pci/io.rs
> +++ b/rust/kernel/pci/io.rs
> @@ -8,14 +8,14 @@
>      device,
>      devres::Devres,
>      io::{
> +        io_define_read,
> +        io_define_write,
>          Io,
>          IoCapable,
>          IoKnownSize,
>          Mmio,
>          MmioRaw, //
>      },
> -    io_define_read,
> -    io_define_write,
>      prelude::*,
>      sync::aref::ARef, //
>  };
>
>
> (I'd still keep the `io_` prefix though.)

With the above change: RB
