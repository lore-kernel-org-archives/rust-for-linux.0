Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4059138229B
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657638; cv=none; b=L1zc+DDUIpZ8RtExifTG8xYIOl1hmp4fXhpcl/fyqljtK1gw8AnPxV1VHJ+UK3Qj0KkRqHwP/N9BrE6VnKC9Ua/9qmecO3iL90Hif9FhNwCz+5REoEW3uv49h/lQwiA0Mu4CI/RRv1o/41PSBHZ1/UAx50LxtWd68SUxkJHAxFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657638; c=relaxed/simple;
	bh=QX1AcmRboNh8rJ6OkuWmVoguzp3UVXGEe0/7F55dKL4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P4clrFg5qXg9wzFnOTYbcGezsDldAovl1+uzt+IJHe3MzrNkpcX5MN8SxQbfO0pghcVthrwrG+8ctlM935lIS1I8fmXTMBCY5nTNLIFg1fnQd8Q1gw2jNgaTEQI59MJHzqLqkL/nQfMbHU83mu05EhKXlZ7dxWvZ0MuWvnsR+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=STOZEUXq; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="STOZEUXq"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439cbfcfc21so4276634f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773657636; x=1774262436; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KKz2KTzlcBf86rOKf9vSTqBmxmc8gj/65J7dXuwwtTQ=;
        b=STOZEUXqrAFGEz0vNuAYL0/zqXYABovI9JSGxZytPrvjs417L5R6YgBQlrUQO2pehB
         PPKDCb66Oe4pAhMjYCw7mQjAywa3vqVesdzVzltpqRxlNXhh2VziXoATFCELc/uEKSOA
         fHNUEtR4BHmzmD5ezJH3Vl8soaqmzKOzQKtf893xB4p1c0da9AzqyCqFWU30msrLXdQr
         zaoIPl/BOqLwx98akudU8tnjgivyf9AZGfpZZ9d7bReV2meol/I77Z0OGpQvpu/YZBvm
         SkYE2ww67/ikJX38ImsAvnqf93kFJjn0+FgYg4LA8CApm2mEe4By9qpgy12QxQib8Zy7
         qogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657636; x=1774262436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKz2KTzlcBf86rOKf9vSTqBmxmc8gj/65J7dXuwwtTQ=;
        b=nOW3ITqhsUSgl6nf4nCAFvi6hPdc6j5UH9CSZ7fYqp71o0nWjJAolTJDSYL9+i5nzn
         8yAQKAZ5L2Iug8NZmotppKExH3HW5dTejKFjACitKrtO6vtyUpFOg+/8bHkbniruX0Fr
         G7d1yv7INVcq1FmiGfQX8Rcw0dUXeW1J3p0GAfziejXe2oGaRMbuG6DRCjanAul7Y3TZ
         AgoCbfMPGPYLGmqPlS1TiZd+NvIwtDFVSE+VDYN6EHQaMOyqkpCgVBW2DrY9QL9oVeQE
         OM8ocoHPTmj1kxtOFlWdPFH8eCxrVdfhn8fg6Z6wwYFNJO72OKLVxle03eyVRn+7piPM
         biZw==
X-Forwarded-Encrypted: i=1; AJvYcCXKIuqBhLh7ImV5GkNrEa1ZmUSXbcvs0xDXTZXWUjp70rX12YAvgFp2lcEICoFEBCnW0sUA38u8f5inzEDcZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjWzyFW7KVEKMbTZHEerI54zYn3Cw5toudXuzcVX8F0DCWllF
	HOeMMPzba3b5Lswk6iHaimYD7uLAKQtMdem9k3I3vVbuLEd5d1sxVi9KYB7mcMbZCd4eqW2pgmF
	ht2a0/h8j10QB/JUvFw==
X-Received: from wrbbs28.prod.google.com ([2002:a05:6000:71c:b0:439:cc48:d5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26c2:b0:43b:433f:489c with SMTP id ffacd0b85a97d-43b433f4a72mr6008387f8f.13.1773657635312;
 Mon, 16 Mar 2026 03:40:35 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:40:34 +0000
In-Reply-To: <20260216-rnull-v6-19-rc5-send-v1-14-de9a7af4b469@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org> <20260216-rnull-v6-19-rc5-send-v1-14-de9a7af4b469@kernel.org>
Message-ID: <abfeIpz8HP_Pr5Yv@google.com>
Subject: Re: [PATCH 14/79] block: rnull: add submit queue count config option
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 12:35:01AM +0100, Andreas Hindborg wrote:
> Allow user space to control the number of submission queues when creating
> null block devices.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  drivers/block/rnull/configfs.rs | 56 +++++++++++++++++++++++++++++++++--------
>  drivers/block/rnull/rnull.rs    | 56 +++++++++++++++++++++++++++--------------
>  2 files changed, 83 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
> index b5dc30c5d3e20..fd3cbf7aa012e 100644
> --- a/drivers/block/rnull/configfs.rs
> +++ b/drivers/block/rnull/configfs.rs
> @@ -59,7 +59,10 @@ impl AttributeOperations<0> for Config {
>  
>      fn show(_this: &Config, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
>          let mut writer = kernel::str::Formatter::new(page);
> -        writer.write_str("blocksize,size,rotational,irqmode,completion_nsec,memory_backed\n")?;
> +        writer.write_str(
> +            "blocksize,size,rotational,irqmode,completion_nsec,memory_backed\
> +             submit_queues\n",
> +        )?;

Missing comma? If so, this may indicate missing test coverage :)

> +struct NullBlkOptions<'a> {
> +    name: &'a CStr,
> +    block_size: u32,
> +    rotational: bool,
> +    capacity_mib: u64,
> +    irq_mode: IRQMode,
> +    completion_time: Delta,
> +    memory_backed: bool,
> +    submit_queues: u32,
> +}
>  struct NullBlkDevice;
>  
>  impl NullBlkDevice {
> -    fn new(
> -        name: &CStr,
> -        block_size: u32,
> -        rotational: bool,
> -        capacity_mib: u64,
> -        irq_mode: IRQMode,
> -        completion_time: Delta,
> -        memory_backed: bool,
> -    ) -> Result<GenDisk<Self>> {
> +    fn new(options: NullBlkOptions<'_>) -> Result<GenDisk<Self>> {
> +        let NullBlkOptions {
> +            name,
> +            block_size,
> +            rotational,
> +            capacity_mib,
> +            irq_mode,
> +            completion_time,
> +            memory_backed,
> +            submit_queues,
> +        } = options;

Nice!

Alice
