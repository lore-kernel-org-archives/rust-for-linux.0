Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710134389F
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113055; cv=none; b=TrJyG2fB/M3i55RAl3UoEGbqoNQ+r8ae5BE/yFzBJ5G8MkcyuqrTgKhcZVk5m9XKGRKFXLfFSfLocH2VRownmZnXcfGxc2FtrXB3ZFnmaRHFT1XG43vvm7Ix3R+YfCcAurLMzaHaEIAlF4MlMIS+zaM1IaxlQFrjbIVMjtQLy5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113055; c=relaxed/simple;
	bh=tVuSkY0xPbMMsGFxv/7unewREw1TqcSDwzB4R9zosBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=b5i5rV0pxssbW4K1A6QkX4G6SdHNENB9nJSHQN6RtjUIPdFRRLAA47mwYtpbgDixOKcnHr59XA927C6j1aXaSiuIpl1mIANgbz+rvSkGLV3XkL/JZC3G6sfM5EcqVB6B6X2W3LdjoEdLYBLz9ol4ZwK4/D1Qswe+0otVii/Cc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VljFHXZ7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VljFHXZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786113052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMjryR7yNkqYmQYfty4PMZSrSilWhqUJMkwdU7e559U=;
	b=VljFHXZ7pBtAfAmn9shpdqI0ipzrwRhDB/igXahB58UnZky58L54Uy1mX1C2QTLmLU6oxS
	SqQFkF3XGTVxDInOL/BOReIIws3aqHY4SvsF6voUWLA054J17EsxpAqSOpdpiq9muqtFa7
	8Kc5+Y2JOKkwRkjNiPTWsfrhI9YnPmk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-gN9PXzybNXO13r0EsIkhDQ-1; Fri, 07 Aug 2026 10:30:50 -0400
X-MC-Unique: gN9PXzybNXO13r0EsIkhDQ-1
X-Mimecast-MFC-AGG-ID: gN9PXzybNXO13r0EsIkhDQ_1786113050
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so3100771f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 07:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113050; x=1786717850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMjryR7yNkqYmQYfty4PMZSrSilWhqUJMkwdU7e559U=;
        b=BLJuByjtd/rEbYdtkdIBz8tql6uboMQLB1Lo14fwZCNay6fVdFReiHmnLlI9VffTNW
         NSN3SOoERbuhBqGKGj8gTqPZ0w08lEjoQtOXHWhySKlwjjeIMMNLrF7G0bVhtWrmJXMQ
         D+P18Dqy8uTsxtUBfLRjZLcLou+4nwdILP9FmubmyiafHw3q0nFlJEEb5ThCvlPotzTi
         3DDaG5nCn8AhaRvXcdyI/SnccFCaY/+APweHcucAc5C/+2nsyrIhrju5xx9zzfUTn985
         uPrJ2NYQRx5kGvwv/NC3RZD5genWuxV9gCZr1vSR3SuxtS6zUSmpl3pj5/UuDSkjX5fR
         gU9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrhOwqEsLO+5g7wmhqpVU5I9q37kcKk6L5Gv5mCSCWQkwdrnn84eycwD9d1nEpeWuiy6viHsA8gq/cKYr7xvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFlW5eTrFfEtmoTOW5KUlgfGt07oU9QFFGo8nx6KugLAX1uWB3
	28Zwj7cgcX6Efla1xmbkilt12G+QxhYiBc6KuDdbmKkh0Pqj2hJVB3MOHTXhwNIq4IBMr4PgkhO
	YaIzIzO6qH+LFgh0yfPo72MvJhMqey+tK2tjQCAp1KxbA7Be8rHyMpuhHKnaMAJPs9BOc
X-Gm-Gg: AR+sD10xzthcf/G75o6fh1fKte9HZ0UmYsGZjCuEGMxsKkB9tg+X6wUl+dV2YmseuDf
	fmE4kkHS8y2Uv3L5LKDvDfkGlQWQDzdgwjO0TgLm806JxaTrvlxga6nt2/iqTsxBgglOcpuSYsV
	ch2WvFOVvEOp450pR8CJS1axqyCvdfBXHavLmH6sQNzZYPXZhYbwvH0n60aeckTjHPWDnbM5j+G
	l9Qrp3dAw4srsFmpyhHtVjklAe1hv6/lUTAVw7znxRiNHdla8Uli5LEcpOZJzkDR7Ox1CLs3LF5
	sLNSXPZMEI9JEN4ks6gjDf3uXnBRehpR3lGXGATLV1cJ1qbCnSx5zJiGmzvU3jkba7qIsWLlgeC
	OIg==
X-Received: by 2002:a05:600c:242:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-49959e0174cmr108314605e9.4.1786113049552;
        Fri, 07 Aug 2026 07:30:49 -0700 (PDT)
X-Received: by 2002:a05:600c:242:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-49959e0174cmr108313685e9.4.1786113048985;
        Fri, 07 Aug 2026 07:30:48 -0700 (PDT)
Received: from sgarzare-redhat ([5.77.96.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995d85254asm26377695e9.1.2026.08.07.07.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:30:47 -0700 (PDT)
Date: Fri, 7 Aug 2026 16:30:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Manos Pitsidianakis <manos@pitsidianak.is>, 
	Matteo Giugni <m.giugni1@studenti.unipi.it>, German Maglione <gmaglione@redhat.com>, 
	Leonardo Giovannoni <leonardo.giovannoni@ing.unipi.it>, Giuseppe Lettieri <giuseppe.lettieri@unipi.it>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Peter Hilber <peter.hilber@oss.qualcomm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 0/6] Add Rust virtio bindings and sample device
Message-ID: <anXnRcX65PnfMe9W@sgarzare-redhat>
References: <20260510-rust-virtio-v3-0-1427f14d67e1@pitsidianak.is>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260510-rust-virtio-v3-0-1427f14d67e1@pitsidianak.is>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _tdZMahJ1sBIvGBsuY1Tyo-RfIU_cujC509R-EFy5uU_1786113050
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sun, May 10, 2026 at 04:38:13PM +0300, Manos Pitsidianakis wrote:
>Hi all, this RFC series adds Rust bindings for Virtio drivers
>(frontends in virtio parlance).
>
>As a PoC, it also adds a sample virtio-rtc driver which performs
>capability discovery through the virtqueue without registering any clock.
>
>Before I send a cleaned-up non-RFC I would like some initial feedback
>(i.e. is it something the upstream wants?)

I had a quick look, I commented something, but maybe you already planned 
to fix some of them in the final version.

That said, overall it seems a great starting point, and I can help with 
the effort of maintaining it.

I had some issues building the rust virtio rtc driver, it seems bindgen 
0.71.1 I had installed have some issues with clang 22, upgrading bindgen 
to 0.72 fixed all the issues.

>
>This was tested with the rust-vmm vhost-device-rtc device backend that I
>wrote[^0]:
>
>[^0]: 
>https://github.com/rust-vmm/vhost-device/tree/main/vhost-device-rtc
>
>Instructions:
>
>  Run the daemon in a separate terminal:
>
>  $ cargo run --bin vhost-device-rtc -- -s /tmp/rtc.sock
>
>  Then run the VM:
>
>  $ qemu-system-aarch64 \
>    -machine type=virt,virtualization=off,acpi=on \
>    -cpu host \
>    -smp 8 \
>    -accel kvm \
>    -drive if=virtio,format=qcow2,file=./debian-13-nocloud-arm64-daily.qcow2 \
>    -device virtio-net-pci,netdev=unet \
>    -device virtio-scsi-pci \
>    -serial mon:stdio \
>    -m 8192 \
>    -object memory-backend-memfd,id=mem,size=8G,share=on \
>    -numa node,memdev=mem \
>    -display none \
>    -vga none \
>    -kernel /path/to/linux/build/arch/arm64/boot/Image \
>    -device vhost-user-test-device,chardev=rtc,id=rtc,virtio-id=17,num_vqs=2,vq_size=1024 \
>    -chardev socket,path=/tmp/rtc.sock,id=rtc \
>    ...
>
>  Example output:
>    [    1.105238] rust_virtio_rtc: Probe Rust virtio driver sample.
>    [    1.105645] rust_virtio_rtc: Found 1 vqs.
>    [    1.136050] rust_virtio_rtc: process_requestq got buf 16 bytes
>    [    1.136125] rust_virtio_rtc: Got response! Ok(RespCfg { head: ReqHead { msg_type: Le16(0), reserved: [0, 0, 0, 0, 0, 0] }, num_clocks: Le16(3), reserved: [0, 0, 0, 0, 0, 0] })
>    [    1.136701] rust_virtio_rtc: Got response! Ok(RespClockCap { 
>    head: ReqHead { msg_type: Le16(0), reserved: [0, 0, 0, 0, 0, 0] }, 
>    clock_type: 3, leap_second_smearing: 0, flags: 0, reserved: [0, 0, 
>    0, 0, 0] })
>    [    1.136724] rust_virtio_rtc virtio0: cannot expose clock 0 (type 3, variant 0, flags 0) to userspace
>    [    1.137259] rust_virtio_rtc: Got response! Ok(RespRead { head: ReqHead { msg_type: Le16(0), reserved: [0, 0, 0, 0, 0, 0] }, clock_reading: Le64(1777890485031060388) })
>    [    1.137277] rust_virtio_rtc: #0 clock reading = 
>    1777890485031060388
>    [    1.137749] rust_virtio_rtc: Got response! Ok(RespClockCap { head: ReqHead { msg_type: Le16(0), reserved: [0, 0, 0, 0, 0, 0] }, clock_type: 1, leap_second_smearing: 0, flags: 0, reserved: [0, 0, 0, 0, 0] })
>    [    1.137769] rust_virtio_rtc virtio0: cannot expose clock 1 (type 1, variant 0, flags 0) to userspace
>    [    1.138247] rust_virtio_rtc: Got response! Ok(RespRead { head: ReqHead { msg_type: Le16(0), reserved: [0, 0, 0, 0, 0, 0] }, clock_reading: Le64(1777890485032086075) })
>    [    1.138264] rust_virtio_rtc: #1 clock reading = 1777890485032086075
>    [    1.138730] rust_virtio_rtc: Got response! Ok(RespClockCap { head: ReqHead { msg_type: Le16(0), reserved: [0, 0, 0, 0, 0, 0] }, clock_type: 2, leap_second_smearing: 0, flags: 0, reserved: [0, 0, 0, 0, 0] })
>    [    1.138751] rust_virtio_rtc virtio0: cannot expose clock 2 (type 2, variant 0, flags 0) to userspace
>    [    1.139253] rust_virtio_rtc: Got response! Ok(RespRead { head: ReqHead { msg_type: Le16(0), reserved: [0, 0, 0, 0, 0, 0] }, clock_reading: Le64(338567896865557) })
>    [    1.139270] rust_virtio_rtc: #2 clock reading = 338567896865557
>
>Concerns - Notes - TODOs
>========================
>
>- Virtqueue lifetimes don't neatly apply to Rust as expected, so a lot
>  of times we have to go through unsafe pointer dereferences (though
>  which are guaranteed by Virtio subsystem to be valid, for example 
>  when
>  a callback is called with the vq argument). There's a potential for
>  misuse and definitely could use better thinking.

Yeah, I see, I guess we can work on this as next step.
I'm CCing Matteo, German, Giuseppe, and Leonardo.

We are mentoring Matteo who is working on his Master thesis at University 
of Pisa. His main effort is to provide crates for virtio drivers (e.g.  
virtqueue, driver-specific request/reply processing, etc.) that can be 
generic enough to be used in different OSes, providing the right 
abstraction.

We pointed out to this series and he would like to collaborate.
Matteo and others can add more on this of course :-)

Feel free to continue in-list or off-list for sync.

>- `struct virtio_device` is not reference-counted like other implemented
>  device types in rust/kernel. Maybe we need to change C API first to
>  make them reference counted, assuming this doesn't break anything?

Good point.

>- The sample driver obviously conflicts with the C implementation, so
>  this would either need to move out of samples/ or figure out some way
>  to handle this in kbuild.

I think we need to discuss this with MST, but IMO we should try the path 
of replacing the C version with this (when we feel confident).

>- kernel::virtio module and its types need a few rustdoc examples that I
>  will add in followup series

Agree.

Thanks,
Stefano

