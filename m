Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD37113BAFE
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Apr 2024 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713886997; cv=none; b=jP5SzIAcJn9eJVpHgSlLKvkzSmzv5w2xZOnad29TtwGwP1K+0HqL7U4F96yMdvYjOPh6DgwZY90sgRTxOGXyICTrvSaPx+vTMzPuO+0UvCFg8Fp/dxm1A1FuGoesg+d00VMyJzjeBWICzDxB+AqrcTmRUfmhBvgwQ1L1auKOYas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713886997; c=relaxed/simple;
	bh=icLDvFvpV72zmE8xOhKfWko0Ndyksl7RQK+s9PmbDeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLRo0wvdAZZl77BqwMK3OquatoPMEpjUinJa/YR1FSQTYTRVHcFCtzKE7XetSUjhTnbrc1CX6DYp2UwFZNvgU/Bj6Nj3DdfDXjH+PnWNyPNTWfJ6tyKaHIatUQbrxhOD7Q/bAsQOddh/M2tWc+2iUI27ts6xnjh9GYeipXoz8q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TXfNz+2J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TXfNz+2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713886994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjKkFTxUJOrFDTkrrK48AIMAMR331JfkUWmmHYXPNWc=;
	b=TXfNz+2JQQllT53d30+UFJKY0zlJUHt2MRK0f7Er3U8LjqG7W0MVc5w/RBf3kmGfpVhcUf
	esL7OYo1U6Ca/Gfh7Yf/q4apdeCq9X2pshIEa3AibKXwXHP5kaekUj185FDcy0WcFRNSTN
	a1qiMxuwySg5qlEfRsCNv2E8ISyKYqg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-RZErGh4LPEy4GlIGoqwH-g-1; Tue, 23 Apr 2024 11:43:13 -0400
X-MC-Unique: RZErGh4LPEy4GlIGoqwH-g-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4396267ee26so79147271cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Apr 2024 08:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713886993; x=1714491793;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjKkFTxUJOrFDTkrrK48AIMAMR331JfkUWmmHYXPNWc=;
        b=VgYXNIu5Xy06mMVnFYxilQcsS0T6VqLeXwVKu+uYmXfKRxgdR5o9BgWXtoEFcu7Rx2
         XEhqyE1g/y2n6VBsSufD2yXiVLLS2N1QJZFb8vabLB+TDtjnay5KpSNgc/Heq98HfZjr
         YbIqqO4zns7g62FTWG6+Dp7MBSqFlJWcxvDgcwB+uTtHB7kE/ck8DaxUbTt9V6Tx3F+Q
         M0tJZZZsdAs5eULqqzSKUpzi5Hh2nQmKO25buZdccdBJIHt1Y2+xOFYLryMrNGrRyRWz
         O2M5/HFAfl2ePBEThq2sR7mAzz7lpN4V6+yKLZLZCuccinEbF6QC9nN9mpwEHmnMSDyN
         3Hqw==
X-Forwarded-Encrypted: i=1; AJvYcCW/aREeBbuj5CV1ysQ5NWwWZZaVi8bfnLVly4HywGCeQJDGZ2qMylgcQWtEHHXni90oxh7JxFoYZzQegP7E5oBBtqQjb/n9UZ98FsUv8c8=
X-Gm-Message-State: AOJu0YxKACjc6QhfXvypddX2BPHzuApJXavdeca2DTK4mo6cDU/9syyF
	MSFsv2zY8TohhUaNFN/fs+GFnstQA4AKuJmYydWlmsl18Fw10B3ibL5deJZGs6RpAODVY5kqyU6
	06JRyWpctR1zP81TJ7g7Vdoj1VG+PPVHpBtrBskyg+O3ZLcVNDl7M80MB58s4ULPO
X-Received: by 2002:ac8:7f03:0:b0:437:cc65:bbfd with SMTP id f3-20020ac87f03000000b00437cc65bbfdmr5683342qtk.8.1713886992711;
        Tue, 23 Apr 2024 08:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVbJXkNB9mPOWQi1awKT+drHechIbxwnI05S+Ty2UC4FXxVkYjTJWlzQwHhj9FWazhjx1ucw==
X-Received: by 2002:ac8:7f03:0:b0:437:cc65:bbfd with SMTP id f3-20020ac87f03000000b00437cc65bbfdmr5683305qtk.8.1713886992321;
        Tue, 23 Apr 2024 08:43:12 -0700 (PDT)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id do7-20020a05622a478700b0043999fccc10sm2461453qtb.62.2024.04.23.08.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 08:43:11 -0700 (PDT)
Message-ID: <cbeae504-2752-4ef0-b103-e62fcf45ab93@redhat.com>
Date: Tue, 23 Apr 2024 17:43:08 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Allocation APIs
To: Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 Wedson Almeida Filho <walmeida@microsoft.com>, ajanulgu@redhat.com
References: <20240328013603.206764-1-wedsonaf@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240328013603.206764-1-wedsonaf@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 3/28/24 02:35, Wedson Almeida Filho wrote:
> From: Wedson Almeida Filho <walmeida@microsoft.com>
> 
> Revamp how we use the `alloc` crate.
> 
> We currently have a fork of the crate with changes to `Vec`; other
> changes have been upstreamed (to the Rust project). This series removes
> the fork and exposes all the functionality as extension traits.
> 
> Additionally, it also introduces allocation flag parameters to all
> functions that may result in allocations (e.g., `Box::new`, `Arc::new`,
> `Vec::push`, etc.) without the `try_` prefix -- the names are available
> because we build `alloc` with `no_global_oom_handling`.
> 
> Lastly, the series also removes our reliance on the `allocator_api`
> unstable feature.
> 
> Long term, we still want to make such functionality available in
> upstream Rust, but this allows us to make progress now and reduces our
> maintainance burden.
> 
> In summary:
> 1. Removes `alloc` fork
> 2. Removes use of `allocator_api` unstable feature
> 3. Introduces flags (e.g., GFP_KERNEL, GFP_ATOMIC) when allocating

With that series, how do we implement alternative allocators, such as
(k)vmalloc or DMA coherent?

For instance, I recently sketched up some firmware bindings we want to
use in Nova providing

fn copy<A: core::alloc::Allocator>(&self, alloc: A) -> Result<Vec<u8, 
A>> [1]

making use of Vec::try_with_capacity_in(). How would I implement
something similar now?

- Danilo

[1] 
https://gitlab.freedesktop.org/drm/nova/-/blob/topic/firmware/rust/kernel/firmware.rs?ref_type=heads#L63

> 
> ---
> 
> Changes in v3:
> - Rebased on top of the latest `rust-next` branch.
> - Updated `krealloc_aligned` to use `Flags` instead of `bindings::gfp_t`.
> - Added __GFP_ZERO to flags, as part of the previous change.
> - Avoiding temporary stack value in `Box::new_uninit`.
> - Implement `Box::new` using `Box::new_uninit` (so only one of them actually
>    allocates).
> - Added examples/tests to `VecExt` methods.
> - Fixed bug in length in `extend_from_slice`
> - Link to v2: https://lore.kernel.org/rust-for-linux/20240327023531.187880-1-wedsonaf@gmail.com/T/#t
> 
> Changes in v2:
> - Updated description of `alloc` crate.
> - Renamed vecext and boxext modules to vec_ext and box_ext.
> - Added derive directive to `AllocError`.
> - Updated safety comment in `BoxExt::new`.
> - Updated `VecExt::push` and `VecExt::extend_from_slice` to use
>    `spare_capacity_mut`
> - Added directive to not compile `destructure` and `rebuild` when `test` or
>    `testlib` are configured. Otherwise we have a warning because `push` and
>    `extend_from_slice` don't use them anymore.
> - Updated indentation in `Arc::new_uninit`
> - Moved the removal of `TryReserveError` convesion to `Error` to patch 7, where
>    usage of `TryReserveError` is actually removed.
> - Link to v1: https://lore.kernel.org/rust-for-linux/20240325195418.166013-1-wedsonaf@gmail.com/T/#t
> 
> Wedson Almeida Filho (10):
>    rust: kernel: move `allocator` module under `alloc`
>    rust: alloc: introduce the `VecExt` trait
>    kbuild: use the upstream `alloc` crate
>    rust: alloc: remove our fork of the `alloc` crate
>    rust: alloc: introduce allocation flags
>    rust: alloc: introduce the `BoxExt` trait
>    rust: alloc: update `VecExt` to take allocation flags
>    rust: sync: update `Arc` and `UniqueArc` to take allocation flags
>    rust: init: update `init` module to take allocation flags
>    rust: kernel: remove usage of `allocator_api` unstable feature
> 
>   rust/Makefile                        |   16 +-
>   rust/alloc/README.md                 |   36 -
>   rust/alloc/alloc.rs                  |  452 ----
>   rust/alloc/boxed.rs                  | 2463 -----------------
>   rust/alloc/collections/mod.rs        |  160 --
>   rust/alloc/lib.rs                    |  288 --
>   rust/alloc/raw_vec.rs                |  611 -----
>   rust/alloc/slice.rs                  |  890 -------
>   rust/alloc/vec/drain.rs              |  255 --
>   rust/alloc/vec/extract_if.rs         |  115 -
>   rust/alloc/vec/into_iter.rs          |  454 ----
>   rust/alloc/vec/is_zero.rs            |  204 --
>   rust/alloc/vec/mod.rs                | 3683 --------------------------
>   rust/alloc/vec/partial_eq.rs         |   49 -
>   rust/alloc/vec/set_len_on_drop.rs    |   35 -
>   rust/alloc/vec/spec_extend.rs        |  119 -
>   rust/bindings/bindings_helper.h      |    3 +
>   rust/kernel/alloc.rs                 |   74 +
>   rust/kernel/{ => alloc}/allocator.rs |   17 +-
>   rust/kernel/alloc/box_ext.rs         |   59 +
>   rust/kernel/alloc/vec_ext.rs         |  176 ++
>   rust/kernel/error.rs                 |   13 +-
>   rust/kernel/init.rs                  |   57 +-
>   rust/kernel/lib.rs                   |    5 +-
>   rust/kernel/prelude.rs               |    2 +
>   rust/kernel/str.rs                   |    6 +-
>   rust/kernel/sync/arc.rs              |   50 +-
>   rust/kernel/sync/condvar.rs          |    2 +-
>   rust/kernel/sync/lock/mutex.rs       |    2 +-
>   rust/kernel/sync/lock/spinlock.rs    |    2 +-
>   rust/kernel/types.rs                 |    4 +-
>   rust/kernel/workqueue.rs             |   14 +-
>   samples/rust/rust_minimal.rs         |    6 +-
>   samples/rust/rust_print.rs           |    4 +-
>   scripts/generate_rust_analyzer.py    |    2 +-
>   35 files changed, 405 insertions(+), 9923 deletions(-)
>   delete mode 100644 rust/alloc/README.md
>   delete mode 100644 rust/alloc/alloc.rs
>   delete mode 100644 rust/alloc/boxed.rs
>   delete mode 100644 rust/alloc/collections/mod.rs
>   delete mode 100644 rust/alloc/lib.rs
>   delete mode 100644 rust/alloc/raw_vec.rs
>   delete mode 100644 rust/alloc/slice.rs
>   delete mode 100644 rust/alloc/vec/drain.rs
>   delete mode 100644 rust/alloc/vec/extract_if.rs
>   delete mode 100644 rust/alloc/vec/into_iter.rs
>   delete mode 100644 rust/alloc/vec/is_zero.rs
>   delete mode 100644 rust/alloc/vec/mod.rs
>   delete mode 100644 rust/alloc/vec/partial_eq.rs
>   delete mode 100644 rust/alloc/vec/set_len_on_drop.rs
>   delete mode 100644 rust/alloc/vec/spec_extend.rs
>   create mode 100644 rust/kernel/alloc.rs
>   rename rust/kernel/{ => alloc}/allocator.rs (86%)
>   create mode 100644 rust/kernel/alloc/box_ext.rs
>   create mode 100644 rust/kernel/alloc/vec_ext.rs
> 
> 
> base-commit: 768409cff6cc89fe1194da880537a09857b6e4db

