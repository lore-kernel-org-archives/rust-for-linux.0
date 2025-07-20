Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0AE208A7
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 20:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753042874; cv=none; b=NNoBVD2SX9ZmBF4x0JS5LTEhX9jwa0A7mjJgstuEfQuHsGFhsEfj3yK9sd7gDBrryAU8L0FIBeUPglS1e8W6+Q//WdijtG4zmQHAZ36S7IfxK+25xQxTCucvWma63/i0avWQb+YkCJQhx49fiV1sF/ILfSnj+kk7KP4Z4EbAxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753042874; c=relaxed/simple;
	bh=i3OpDp6GUcBgyD7nVFA8rvtMwYwGqH2Ruhus24O6PMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grMUJnHNcPodJGcxSsMFybLbMsNOFZGPZtrdsXhiYzsThgC8suqSileA4rRAqs2s6GTt+6eX025RHQaVvNRlCKtWEtmXFEyAbMYUX1kfAG4VDxG2OX76Tb8oKYAgwyxftw5iMhvthU+JYKVDr9B1KT/l8ZfHgi7vR9xCEVSlSvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bRz4bSWC; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bRz4bSWC"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-313290ea247so638190a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 13:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1753042873; x=1753647673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgQF+os2zt2fS8ZD9Pne7S+zqukANXwnLxzYWaaxPso=;
        b=bRz4bSWCPEuiQOTpFjJevbjlXEAGW88ptuzqAlU/7wxjffaxopVGZwY1+JnjUqPQJ+
         LgNfVp+F5EjGVPAfxCc/HbFjhDrMClkLARamxgHK2a+8KNNlPzArNfc6F9Hu02GKKJL+
         YJD1R3nDLIVR2rubH3GmdzL+tvFMQxVL8GhIPV8gyIkHVY0aNGj5W2dPcX5mBgpBwcn0
         /hbvU+mMqDB7aIhBTSVYRN2+A8U4ykENmktFREa7oxqoeyRQSKUA8O3TkmyTIO2J80Nf
         muUssel6yh/1xcZHRpv9UjnhKpT3UdD/bzDY+plLVuKUc1tyK1CzIowlQVbHKJdvGIgx
         YkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753042873; x=1753647673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgQF+os2zt2fS8ZD9Pne7S+zqukANXwnLxzYWaaxPso=;
        b=w9Llyj3/9vmdAsZIw0dCCIXtFZTxbX8HshXk+/dr//YxJQICC7gt6gV9tvghJ0ewAK
         nxvDmU1FuM9O32oKtCx7Gvb4D67aho/Vyw0kwci8F2eo7HkL/jkLBnsNZK/2EwmIgL7b
         /PW6LdaINhR1tmUlmmmTYoGParlM/vKd/K/2/WL8SHMpgdtEoJlMKVLMLAFDe1osIdCm
         c6a86DkpR917JsdQ6fovGCL7h4a2yuvXiPhhPTTbKrFuHet6pigA3OOaIok1bn/ObXFC
         khic5daJxPkZMQE6DKhWomQToPbimktc9fO/pBCEfGzw/aiespA9afONAXzzpUet3o5e
         AorQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGsBGgVDbq0XmrzRU2Dm6S2jdt17VDOTcDAgSKCvSo/Rnl/oJwYjMtE7873oc6NAxpqLHVstYoRyrkp6a5uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4tNkhr0svJ3naVxyZGDbCvn57KWAtUvbsL/F0GolPxs8xvlWz
	KQ4yLjCtaheHZ3h32TJzoo/cUuJDxE81Y1sIhbIRCjIlTKHydWRmJEyUS2JV8Ss8k4cQDGfA/7x
	GLVpTCnDMVqLd2Yj+SAlLHZoLAKg4lC2hjR09Y5hfLA==
X-Gm-Gg: ASbGncvxJPFeDCs6KxaVH7siyxg0XOOe6m6ywWruM/HbW5Bcv5qerYHf3CGncCYaiyR
	QmVWXPx9nC6fOG9K/yLk1mbEJsw0RI7gmKMipKGIJKA9xBX+tKOAiWqVnn280st7D+RVlIBzkVY
	lBkjrpnrCXpCaQasx2IDU7RC+srPTZtV1OVmqvowTnHnSvomLfROXj7jFV4aF/vm1+qbGZPPj0v
	s1qgg==
X-Google-Smtp-Source: AGHT+IEWxc8ZXBpGnuH7BtjlkjbLy1+k0TfoVszqQadn+Lip/Uf9JIC2KIrML2pi3hIF+AZtqdaq/0v/JpXSmKvLfhg=
X-Received: by 2002:a17:90b:5610:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-31c9e6048aamr12302789a91.0.1753042872549; Sun, 20 Jul 2025
 13:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250719143358.22363-1-sidong.yang@furiosa.ai> <20250719143358.22363-5-sidong.yang@furiosa.ai>
In-Reply-To: <20250719143358.22363-5-sidong.yang@furiosa.ai>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Sun, 20 Jul 2025 16:21:00 -0400
X-Gm-Features: Ac12FXyNBpWr6ecWxgZNuFpVIAdDVVSKNB1T_-1vERAcvQs9WnfiPq_xSp5xYWw
Message-ID: <CADUfDZqv_KEhUaS58CuZDPB8PvcigxBFDJSPY_Kq9WFViug4+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] samples: rust: rust_misc_device: add uring_cmd example
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 10:35=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.a=
i> wrote:
>
> This patch makes rust_misc_device handle uring_cmd. Command ops are like
> ioctl that set or get values in simple way.
>
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
>  samples/rust/rust_misc_device.rs | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_de=
vice.rs
> index c881fd6dbd08..cd0e578231d2 100644
> --- a/samples/rust/rust_misc_device.rs
> +++ b/samples/rust/rust_misc_device.rs
> @@ -101,6 +101,7 @@
>      c_str,
>      device::Device,
>      fs::File,
> +    io_uring::IoUringCmd,
>      ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
>      miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
>      new_mutex,
> @@ -114,6 +115,9 @@
>  const RUST_MISC_DEV_GET_VALUE: u32 =3D _IOR::<i32>('|' as u32, 0x81);
>  const RUST_MISC_DEV_SET_VALUE: u32 =3D _IOW::<i32>('|' as u32, 0x82);
>
> +const RUST_MISC_DEV_URING_CMD_SET_VALUE: u32 =3D 0x83;
> +const RUST_MISC_DEV_URING_CMD_GET_VALUE: u32 =3D 0x84;

In real uring_cmd() implementations, the cmd_op values are assigned
using the _IO* macros, same as for ioctls. But I suppose that's not
strictly required for the sample driver.

> +
>  module! {
>      type: RustMiscDeviceModule,
>      name: "rust_misc_device",
> @@ -190,6 +194,32 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd=
: u32, arg: usize) -> Result
>
>          Ok(0)
>      }
> +
> +    fn uring_cmd(
> +        me: Pin<&RustMiscDevice>,
> +        _file: &File,
> +        io_uring_cmd: &IoUringCmd,
> +        _issue_flags: u32,
> +    ) -> Result<isize> {
> +        dev_info!(me.dev, "UringCmd Rust Misc Device Sample\n");
> +        let cmd =3D io_uring_cmd.cmd_op();
> +        let cmd_data =3D io_uring_cmd.sqe().cmd_data().as_ptr() as *cons=
t usize;
> +        let addr =3D unsafe { *cmd_data };

The io_uring_sqe is user-mapped memory, so this load needs to be
atomic. In C, the uring_cmd() implementation would use READ_ONCE().
Sounds like Rust code is currently using read_volatile() (with a FIXME
comment to switch to read_once() once that's available).

Best,
Caleb

> +
> +        match cmd {
> +            RUST_MISC_DEV_URING_CMD_SET_VALUE =3D> {
> +                me.set_value(UserSlice::new(addr, 8).reader())?;
> +            }
> +            RUST_MISC_DEV_URING_CMD_GET_VALUE =3D> {
> +                me.get_value(UserSlice::new(addr, 8).writer())?;
> +            }
> +            _ =3D> {
> +                dev_err!(me.dev, "-> uring_cmd not recognised: {}\n", cm=
d);
> +                return Err(ENOTTY);
> +            }
> +        }
> +        Ok(0)
> +    }
>  }
>
>  #[pinned_drop]
> --
> 2.43.0
>
>
