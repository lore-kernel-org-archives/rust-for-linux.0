Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6D7F477
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 05:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753076748; cv=none; b=Xebam7+nEAqh5TU31Xj15mruRwiYF0+Th5P1Q/1Cw4t6AwxGR5mpvM7e9Skk2INXI7k2ZtPYIHo7vF0rtkGDSvdPbhOofaPdyGZJCLsVwByQ3zZ6XztvB/86r5y7Fxn2FLruvDxuXjwKq3sWKmQBpgWnznordzQ5zNW8yWmLDN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753076748; c=relaxed/simple;
	bh=dhHkGM4HOFFI97fX7h+8fak0kAldA+FYKGT9ABTfj+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDboNzPLCEHXuQhBGKAxkLDUy6PMtW7O7B9dLGVTd3Bs+qv9s/E7R3TRHlDTeJm+utS1GFqGAzw+B5O1XFGxQQdYbQnBZ+RooJJRcw/aBGIO5sOTEEYxfgFYtYnCMW4gbEZt+HaSD7IqN8SJuuO7tnTB/iBMiQs38Qt45R++Ggg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=alce6hbV; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="alce6hbV"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso295544b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 22:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753076747; x=1753681547; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Villbo2O3xbSxL7XAkPoEJ4g9IjLoflfkAnI89yF/Y8=;
        b=alce6hbVxZIsnLlNaqV/jMqKXlRVnl2l13Nk3DSceKWPtwsuRTHfXi05RT91Pf/U8L
         iedrYDOR4wKvhqZNz5Fm6wKLwOiY3f2Eo5iukll3O9xk8oTBJCv4r3DJv2tG86UXP3JU
         lw8qhaSqchHYIXKw9OM+hl0LCg8d2c+P+FmXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753076747; x=1753681547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Villbo2O3xbSxL7XAkPoEJ4g9IjLoflfkAnI89yF/Y8=;
        b=TroEckTL4SFfvsV0AxKjeZgqiHZ3QYd5G9T36zLs78cuSnBdoWminaPKsqKe6Lfs6I
         DqXYuVobAsrquDwLwX8Lqye1ZPZQtyVIbEDy/Zea6vpAiiQZqdNoQEwk/tThIRQQhRSG
         R960iB5LtA/3R4Za3ooZcZwGorG+6hzZiupOQsYFOFAejYxPZEiI49+zphKlRQhqXfNM
         vGdSThYJyoPC77PLHutpCne1LVUZt8M3oOWN4/X8ulKsPByrxbtFJp/m5gis5Z/iqWS6
         GXVJHtoeDqituqrLrggn+WobWmXLMt0K1uXzTo/vhPVCG3z5E6u2+IhNhMgrfZ+MXKj7
         VjNA==
X-Forwarded-Encrypted: i=1; AJvYcCUagttLlEnL61NfbnCcjA46CfAVUGfrnbcnocMbjbdFrVf3OYhp3EwVe/ZzOuwG+Mb02ivn3xzFfhlX4IColg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTheqTHdvJ8WjjKVWM9QrJ2F3u2+h9G5nmgcFdSu4s1jA0PXVE
	lnSswsaCDjZpNesyAEOXt874weFm3Ttii6Pfwkj3j2t1/+a8PX3ApanTB3EOv2vbOqA=
X-Gm-Gg: ASbGncsRGCvdac48CrKzqF2hirHuCkOsXSeJHAJDCrgfmX8bhQnNmGZzicxmdqLmwZF
	M8uKCyNCZgWOCCBLWqO0CM0G9Qd67iLpH86gZz6URFQhqZ2+9ZYY1wOh6cX+UG2L8ZFT0p9tftw
	Nx6jC9ivrUEt02XBFfujzONse+q2RS5slHCXuifOi6rBmIVgwqDO+ItHzzvRp6ltvr+KX4PETDJ
	e3Ugc4lsikGtVZcNNnQU1fEeMCmanj2XqqSzFXFmFIBeG4cCxfxpJdDa5pTWatDmJNSkG5e1gqW
	Px9XHAFcLDcLTYoLlX45cfVJ0mOJC8eZvGEXUpanN3WQ0kXsl2OFg+kBbvGJpNnQDKh4KYgzWIz
	Ak52Jvv82ShIKi9DdT5slxQi/WuG+pX/djCAzzxfY9dlIGxxsFqRbsw==
X-Google-Smtp-Source: AGHT+IFUVUK6qkClKAF7WZOshF2ErH+fD4E7lxm5DovPekHz1U5qqyaeOww9M5SA2fLd7fbp0Ylvqw==
X-Received: by 2002:a05:6a00:2ea6:b0:74e:a9ba:55f with SMTP id d2e1a72fcca58-756ea8c31f7mr25241718b3a.20.1753076746713;
        Sun, 20 Jul 2025 22:45:46 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([221.148.76.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb774da4sm5044116b3a.122.2025.07.20.22.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 22:45:46 -0700 (PDT)
Date: Mon, 21 Jul 2025 14:45:41 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH 4/4] samples: rust: rust_misc_device: add uring_cmd
 example
Message-ID: <aH3UBei_VL25P0PK@sidongui-MacBookPro.local>
References: <20250719143358.22363-1-sidong.yang@furiosa.ai>
 <20250719143358.22363-5-sidong.yang@furiosa.ai>
 <CADUfDZqv_KEhUaS58CuZDPB8PvcigxBFDJSPY_Kq9WFViug4+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUfDZqv_KEhUaS58CuZDPB8PvcigxBFDJSPY_Kq9WFViug4+w@mail.gmail.com>

On Sun, Jul 20, 2025 at 04:21:00PM -0400, Caleb Sander Mateos wrote:
> On Sat, Jul 19, 2025 at 10:35 AM Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >
> > This patch makes rust_misc_device handle uring_cmd. Command ops are like
> > ioctl that set or get values in simple way.
> >
> > Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> > ---
> >  samples/rust/rust_misc_device.rs | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
> > index c881fd6dbd08..cd0e578231d2 100644
> > --- a/samples/rust/rust_misc_device.rs
> > +++ b/samples/rust/rust_misc_device.rs
> > @@ -101,6 +101,7 @@
> >      c_str,
> >      device::Device,
> >      fs::File,
> > +    io_uring::IoUringCmd,
> >      ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
> >      miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
> >      new_mutex,
> > @@ -114,6 +115,9 @@
> >  const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
> >  const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
> >
> > +const RUST_MISC_DEV_URING_CMD_SET_VALUE: u32 = 0x83;
> > +const RUST_MISC_DEV_URING_CMD_GET_VALUE: u32 = 0x84;
> 
> In real uring_cmd() implementations, the cmd_op values are assigned
> using the _IO* macros, same as for ioctls. But I suppose that's not
> strictly required for the sample driver.

Okay, I'll use same _IO* pattern with ioctl.
> 
> > +
> >  module! {
> >      type: RustMiscDeviceModule,
> >      name: "rust_misc_device",
> > @@ -190,6 +194,32 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
> >
> >          Ok(0)
> >      }
> > +
> > +    fn uring_cmd(
> > +        me: Pin<&RustMiscDevice>,
> > +        _file: &File,
> > +        io_uring_cmd: &IoUringCmd,
> > +        _issue_flags: u32,
> > +    ) -> Result<isize> {
> > +        dev_info!(me.dev, "UringCmd Rust Misc Device Sample\n");
> > +        let cmd = io_uring_cmd.cmd_op();
> > +        let cmd_data = io_uring_cmd.sqe().cmd_data().as_ptr() as *const usize;
> > +        let addr = unsafe { *cmd_data };
> 
> The io_uring_sqe is user-mapped memory, so this load needs to be
> atomic. In C, the uring_cmd() implementation would use READ_ONCE().
> Sounds like Rust code is currently using read_volatile() (with a FIXME
> comment to switch to read_once() once that's available).

Yes, I've missed this. read_volatile with comment would be good.

Thanks,
Sidong
> 
> Best,
> Caleb
> 
> > +
> > +        match cmd {
> > +            RUST_MISC_DEV_URING_CMD_SET_VALUE => {
> > +                me.set_value(UserSlice::new(addr, 8).reader())?;
> > +            }
> > +            RUST_MISC_DEV_URING_CMD_GET_VALUE => {
> > +                me.get_value(UserSlice::new(addr, 8).writer())?;
> > +            }
> > +            _ => {
> > +                dev_err!(me.dev, "-> uring_cmd not recognised: {}\n", cmd);
> > +                return Err(ENOTTY);
> > +            }
> > +        }
> > +        Ok(0)
> > +    }
> >  }
> >
> >  #[pinned_drop]
> > --
> > 2.43.0
> >
> >
