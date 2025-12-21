Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E14D8CE
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Dec 2025 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766308759; cv=none; b=bL5VsKyccoaSKrtpObRbLYAQrI8qAZVlnICP1IxToFAGXpAWLdFam9ENAXtgBNfCR/kjSd3M+9lkx2TzVcBMSULpG/4MvBT6tmSdsBCicZXOH0uexKu90sYW1g9Qgj6Eiwe5YmlXnLXayjQFp+ls12IyBmyRuSlZRiXYpHbCRYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766308759; c=relaxed/simple;
	bh=eqlkQJRKqtMXVBqn3VqjTrRNC3dJwL/DIWa+q2BpyEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIoSWqE8AoRwf6kwzfdu5HJsh0bdvg3YsP6K85h4yUe5lRDMVE64BKK5W4lvP55Tfa7lxPISThiENxPxYeMaEdvi9cof8y/eZ+sx/aEB5bw9G98Tnqkqoyvf4ulkFtYrAWvT02SMeu4wQghftGuv4TOew69nvvO7cdOi4hiu4Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfungn1d; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfungn1d"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso31721115e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Dec 2025 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766308756; x=1766913556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVxQ7m55+e7xHSmDYkZzWySVBucnYtEFV6uMMTNQV4s=;
        b=nfungn1d3c45/tiMnDaneo84S1c++KsDtsW9v5I9enmkWUysc+hel6YCets78c1aD/
         bJvs/BLmA+Vsv5Bwq9UZOowRG1gwAkFnZv88Hm75tO1KGuUysbPBrEIAMet/+zfspsri
         IOTZ/BOFNhcJSXJTPNpp5a7PnMad41IJfIsjMuBX29dsoJaEu4TY33rW1ozTMZq2y7QQ
         3FV7GjvaqfFNmxmk3YLunied4VFkIPDnjNHk+yulWqc2gvLtHnB4MJZnU1kzVs+vddYK
         zUMCZ0cOQ4iJpjvfGGyugNyLTxGAs3cRQg59qQeQO0cGqp3EBwdWRYNBjMmFZFfw/fZr
         k0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766308756; x=1766913556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVxQ7m55+e7xHSmDYkZzWySVBucnYtEFV6uMMTNQV4s=;
        b=jQDeE0oxA2NqlsnATohBTnNHPpBonn9r2hZrTXeKU+c17Jqebf9+zQAuLrVPWx/qTA
         T+VaPAZwD3w94//jkugdaE9GbwiWg4hUGtYqu2NRo8d0tp/vscF8V4IsudI3c5zXvbTt
         mMt2lIiyjpQ+c0SLq07G0BIkYdHy8/I3BhDKSg4va5yhOIOOzDyzjQ6fHtzcXK1USB+n
         FhrRO/CbGjLPyjqvf/YwQLOtPbRHwqVpLNJIQvWE+3GsdCHfy4wAfM0Ji07SOXlBuEjf
         hTDgD+xnDoX7svEPJEtB1tRP64ERi5P6eBWKn0WVkgyNoEbL+kgFzkpbhiYMMEQtQlAC
         1xOg==
X-Forwarded-Encrypted: i=1; AJvYcCW7zR2eovZOLOvzXj30p8fHXvI4NyJ9MAFgcejZI0mCU6M34AQodiZL5rgT81JheQFMIptc1ax4j4xetk/m8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMx9jl/0bhMTCi7+QMFm5eULP7jHGcHCCobUnOtH4QJkd1lhXQ
	hc3dQwSJ28Cy52MhyfKMKHn2PEWsVQ7bJa0TVwZD3snXnwpK6dQiYWla
X-Gm-Gg: AY/fxX4LmIBBrT7ORBuss9yMYtm8qr7YiN5yvLgUwvypw/vZTnsiuvCOxa9oWBcRd+E
	HMpKOlPhbClAVBS762MTdDcvVmtdO6q6EChuZioO0o/hGXRgPiU1kC9E0/buSltv8daW/DTgCwf
	/VXHaBgd4KAI1ZNH53r6mq2XAVt1AlcCgCEOUKt9X5EuDl0VI6jAYWGOlAnA8hlcTqIW4W0Hbbs
	0Iy4ZRV03qHVI+rKB9CtqJlgSwfC3NrI5wTnw1/YLli6hMUzzUuDeC6H6JKGJ8TpHaZSvNUSJKo
	qOyjZKb6aup+Fl3JYif41JgeGGiI+aH3dWZe+Yp2i43g0wRxUpDhQJAg0+UJvE6yFGVAvFiYxtY
	qZnUqDjInEl2BSAiiahqri7x+s8ZJSzVJyVK+y/ufwgR1w+TDkFmjOQyxrKkP4sDO3XRzclOpFk
	8zM0nnWesTTSQliub3o9HgZR/TO1i3OgXjXLg+kEjunFKq9mevHV9svCQHZDlKtY0fNNhjXoYOI
	Ujh0KSxq7B/g0Xgy9ic/Yod9xi1TtqepJfAORYRN98niw==
X-Google-Smtp-Source: AGHT+IFp7in95JzQaIywx+426dSw180lBWFw57Wf1Axn7bxB9kmLd4882MV17fHyMLI/zt2kGj3nPQ==
X-Received: by 2002:a05:600c:858e:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-47d1c629902mr58448525e9.4.1766308755542;
        Sun, 21 Dec 2025 01:19:15 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:9f8f:28b1:4136:8493? (p200300dfbf2de3009f8f28b141368493.dip0.t-ipconnect.de. [2003:df:bf2d:e300:9f8f:28b1:4136:8493])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm135746565e9.3.2025.12.21.01.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 01:19:14 -0800 (PST)
Message-ID: <4c26408c-b8ce-42a6-b0df-47053fd81eda@gmail.com>
Date: Sun, 21 Dec 2025 10:19:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] rust: add basic serial device bus abstractions
To: Markus Probst <markus.probst@posteo.de>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Kari Argillander <kari.argillander@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251220-rust_serdev-v1-0-e44645767621@posteo.de>
 <20251220-rust_serdev-v1-2-e44645767621@posteo.de>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251220-rust_serdev-v1-2-e44645767621@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Markus,

On 20.12.25 19:44, Markus Probst wrote:
> Implement the basic serial device bus abstractions required to write a
> serial device bus device driver with or without the need for initial device
> data. This includes the following data structures:
> 
> The `serdev::Driver` trait represents the interface to the driver.
> 
> The `serdev::Device` abstraction represents a `struct serdev_device`.
> 
> In order to provide the Serdev specific parts to a generic
> `driver::Registration` the `driver::RegistrationOps` trait is
> implemented by `serdev::Adapter`.
> 
> Co-developed-by: Kari Argillander <kari.argillander@gmail.com>
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/serdev.c           |  22 ++
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/serdev.rs           | 815 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 841 insertions(+)
> 
...
> diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
> new file mode 100644
> index 000000000000..0f5ef325a054
> --- /dev/null
> +++ b/rust/kernel/serdev.rs
....
> +    /// Write data to the serial device until the controller has accepted all the data or has
> +    /// been interrupted by a timeout or signal.
> +    ///
> +    /// Note that any accepted data has only been buffered by the controller. Use
> +    /// [ Device::wait_until_sent`] to make sure the controller write buffer has actually been
> +    /// emptied.
> +    ///
> +    /// Returns the number of bytes written (less than data if interrupted).

Should it be "less than data.len"? Instead of just "data"? Same in the
comment for `write()`below.


> +    /// [`kernel::error::code::ETIMEDOUT`] or [`kernel::error::code::ERESTARTSYS`] if interrupted
> +    /// before any bytes were written.
> +    pub fn write_all(&self, data: &[u8], timeout: Timeout) -> Result<usize> {
> +        // SAFETY:
> +        // - `self.as_raw()` is guaranteed to be a pointer to a valid `serdev_device`.
> +        // - `data.as_ptr()` is guaranteed to be a valid array pointer with the size of
> +        //   `data.len()`.
> +        let ret = unsafe {
> +            bindings::serdev_device_write(
> +                self.as_raw(),
> +                data.as_ptr(),
> +                data.len(),
> +                timeout.into_jiffies(),
> +            )
> +        };
> +        if ret < 0 {
> +            // CAST: negative return values are guaranteed to be between `-MAX_ERRNO` and `-1`,
> +            // which always fit into a `i32`.
> +            Err(Error::from_errno(ret as i32))
> +        } else {
> +            Ok(ret.unsigned_abs())
> +        }
> +    }
> +
> +    /// Write data to the serial device.
> +    ///
> +    /// If you want to write until the controller has accepted all the data, use
> +    /// [`Device::write_all`].
> +    ///
> +    /// Note that any accepted data has only been buffered by the controller. Use
> +    /// [ Device::wait_until_sent`] to make sure the controller write buffer has actually been
> +    /// emptied.
> +    ///
> +    /// Returns the number of bytes written (less than data if interrupted).
> +    /// [`kernel::error::code::ETIMEDOUT`] or [`kernel::error::code::ERESTARTSYS`] if interrupted
> +    /// before any bytes were written.
> +    pub fn write(&self, data: &[u8]) -> Result<u32> {
> +        // SAFETY:
> +        // - `self.as_raw()` is guaranteed to be a pointer to a valid `serdev_device`.
> +        // - `data.as_ptr()` is guaranteed to be a valid array pointer with the size of
> +        //   `data.len()`.
> +        let ret =
> +            unsafe { bindings::serdev_device_write_buf(self.as_raw(), data.as_ptr(), data.len()) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret.unsigned_abs())
> +        }
> +    }

Best regards

Dirk
