Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991EC2F4A10
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539978; cv=none; b=B8W9XqeWQpXAL28TA1FvPnX0AP9JgA76/Z/I27Gf0kzwv/TtxMpUNlmeuZ1tZfyc+SUB/J2Otj867S/1ZmvwGKUsDrdRJZFg22FqFEFdQ1ECpwOt4gt+wB0YiCBNVdVN1LIpKF9SmIWWxCkPNx7wACTtGvqXVopWysiH7c07d+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539978; c=relaxed/simple;
	bh=0SLkXa+8Mvb2JJUcW2mn/40DvxfBHoOzwKT8eGz7Ou8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0NJL7NlxZLcffDRauOQ4hLDqshsrTVwWPamB7kDGRZIJG1B1Jql8d8tDUvZtLZUXifWfk2NK+ba1dmb5vadPHac/lR6uHTroCmPUtmqEVj5E1wpV31EZwRIZ3kvtguQ+uzswPb0W5pUbvnQlUWrtj9DAKcRtldu78Ji45AfLqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Brgx0hS5; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Brgx0hS5"
Message-ID: <f2385851-87c0-44d1-8e1c-4e5553aa1893@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769539964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcDvOOF9atTTdyzq0wxACPIx1fFSat02oW2ylkZN+wQ=;
	b=Brgx0hS5LhwaYUCrnmyJK5OH7O++5ODspRjbtxdLBS2IDGHT54uyShzv7FqN2yWc1zFYr1
	lScxjUcZdnvW07d0ozG2/rPtiuvRHh7/mqP153t4L8fup/a5/1+RV2Oby7YfzBObsQAReX
	iI/ZLCHq43whiFWJc0/6KkocRsvW9YE=
Date: Tue, 27 Jan 2026 18:52:40 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/8] rust: samples: i2c: remove redundant `.as_ref()`
 for `dev_*` print
To: Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-5-gary@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <20260123175854.176735-5-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi

On 1/23/2026 5:58 PM, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This is now handled by the macro itself.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>   samples/rust/rust_driver_i2c.rs | 10 ++++------
>   samples/rust/rust_i2c_client.rs | 10 ++--------
>   2 files changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i2c.rs
> index 6be79f9e9fb5..3079d57fe473 100644
> --- a/samples/rust/rust_driver_i2c.rs
> +++ b/samples/rust/rust_driver_i2c.rs
> @@ -44,23 +44,21 @@ fn probe(
>           idev: &i2c::I2cClient<Core>,
>           info: Option<&Self::IdInfo>,
>       ) -> impl PinInit<Self, Error> {
> -        let dev = idev.as_ref();
> -
> -        dev_info!(dev, "Probe Rust I2C driver sample.\n");
> +        dev_info!(idev, "Probe Rust I2C driver sample.\n");
>   
>           if let Some(info) = info {
> -            dev_info!(dev, "Probed with info: '{}'.\n", info);
> +            dev_info!(idev, "Probed with info: '{}'.\n", info);
>           }
>   
>           Ok(Self)
>       }
>   
>       fn shutdown(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
> -        dev_info!(idev.as_ref(), "Shutdown Rust I2C driver sample.\n");
> +        dev_info!(idev, "Shutdown Rust I2C driver sample.\n");
>       }
>   
>       fn unbind(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
> -        dev_info!(idev.as_ref(), "Unbind Rust I2C driver sample.\n");
> +        dev_info!(idev, "Unbind Rust I2C driver sample.\n");
>       }
>   }
>   
> diff --git a/samples/rust/rust_i2c_client.rs b/samples/rust/rust_i2c_client.rs
> index 8d2c12e535b0..72da5499f150 100644
> --- a/samples/rust/rust_i2c_client.rs
> +++ b/samples/rust/rust_i2c_client.rs
> @@ -113,10 +113,7 @@ fn probe(
>           pdev: &platform::Device<device::Core>,
>           _info: Option<&Self::IdInfo>,
>       ) -> impl PinInit<Self, Error> {
> -        dev_info!(
> -            pdev.as_ref(),
> -            "Probe Rust I2C Client registration sample.\n"
> -        );
> +        dev_info!(pdev, "Probe Rust I2C Client registration sample.\n");
>   
>           kernel::try_pin_init!( Self {
>               parent_dev: pdev.into(),
> @@ -130,10 +127,7 @@ fn probe(
>       }
>   
>       fn unbind(pdev: &platform::Device<device::Core>, _this: Pin<&Self>) {
> -        dev_info!(
> -            pdev.as_ref(),
> -            "Unbind Rust I2C Client registration sample.\n"
> -        );
> +        dev_info!(pdev, "Unbind Rust I2C Client registration sample.\n");
>       }
>   }
>   

Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>

Thanks
Igor
