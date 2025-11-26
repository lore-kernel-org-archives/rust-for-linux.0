Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E32F3635
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764124147; cv=none; b=nKFZN6if36JbpgVYknxFSUWTiOcgBgJMk1O+O8bNAmhYyOUerhZrm6K6qWIN3adHpwOUNjitV7yeQRI7uQUdnTNGBwx99gl3L6mgekQc6oJDPBkL7sMgMpn75vyil81zHw/ksRqW1Zw36zp0dNKmmzzsyhMqCaDou8k9D9YmK+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764124147; c=relaxed/simple;
	bh=lfq0aE/uOKKE82YpgbwQm2nw8rZn5PS4lQVayxnjHmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOM4nYUPKjczLfze6ettbe93nssp8ZVspyguWQwQz07048NI/ptwjktAqxtfvQWLuoG2xVHOlmDI8fegVYtisR2jCDRyIn7wkhgUcOtSxbipkS28fD+aD5RFBdoth3rB9W8T3HK2TzmYRkvfqlTw5TYmvrkznkhyNN6FCGRTcak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrjpxRwn; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrjpxRwn"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ed7a7ddc27so51585821cf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 18:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764124144; x=1764728944; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ii9s7RApHj9sHrWInlezgTQVkHCx4EY/ZCHwMXD/Hgk=;
        b=VrjpxRwnVmWZb5igZs9CoAN/bwaPwT+kRYMD8cPU1H8Mm6QIueNQHuKo5qBgrcqvlU
         Muk0tShqcZM5nZ0OKUgk26Edq6d6mdqJp91O9X2loU2P1M/TeC82uYQxO2exAoCF1Dyn
         UI31AiuALlTelOdZn7cSEbdYR5icjzdU/Qk6881UGAf5EYs1RjCU8x3g372bSl6TWagT
         zg9hfK7L1FrJyBgj7+4VeDq5Sbc/ktTWwTwIc7vz9k58z1dj5UInVlvjiONeNRS29/1v
         hoAD1cUBytM7UYqYjWFzbPuiK3Po4GZIdXsJkrsirgGaXSaZlbJPTsgMTFCGoN4KeXWg
         kNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764124144; x=1764728944;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ii9s7RApHj9sHrWInlezgTQVkHCx4EY/ZCHwMXD/Hgk=;
        b=DRjXPG92E5fj6shuGzT6kdKLENI9h0IL8eyGYXuqJ+wKooCQ73JvblLLWcX7pmTp8p
         L5vHGX/NMHUMfWt7EZtLtXGTVUnIkTRKh43+bx3QWwEuFsaSw4vQ1KXlfU1rifvt1Y+Y
         owj9FUSJWc4vfkwZlvLPSLiGX/cJXIfODlhu6zPWud0jugb1zzB0OJUPXK7QnnJgnRz4
         KLRN9ooFIgwOYG8ps1kYYI4xQj7W65b6pMChPrjdEkcuI5Ooa7TrWmbtLqofH1vI0Ndi
         uBaSWg3j+LjlqpSNkZLb7z5EMqkkjYtzMyfiErEOsA42CTzF3OMxEngZ2Jd3T239J0tk
         ZjMg==
X-Forwarded-Encrypted: i=1; AJvYcCWith9kjF21BoT+/z1zz6ycPuSqBFGP6+t/3qgeElgO+FujUAAqyCsOhzsZOMp3A0VwKZcxlTy9P644sm7krw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1dxdeZqLOuIKtG1Q5fajoLXCiFC6hmGeHXaMWWtWXtYFvCOJL
	dZ4lfFMH/5zUNh2iA6bIxyc+8YPacvzEleEjeivJeFuVyXtR37ZXuzPI
X-Gm-Gg: ASbGncvdrJI7E3MnQLRxSHjPMWRPHijw832enOO6S4TAdv+pDZ3nF3MX+8WuWv7mlTo
	JIs1ZBzxkrXI/6p5doaF7prQxqUHOow3pstVxlYwnNJ0Alf+fe81h4QR0qQB3x03qmkvXQHcTHG
	rpf9GX2biYgS/BRM1hZh1d51C966S2QoyPvD7boFN6x3OkuMgWbHDNn77seubfG1m3TNNYTpAE6
	luHS6EnH8UaHRUsBsFg0maVAnQ33EI4xNdfDU865UxX4tHQJ683Z3UEJVegz2Pe699zGsmxpyrM
	F4HVMp4+IVgq4kvSccIhg9o9uR6ZDFGSAPapwv2hd6d7/ozyCWC/bZiOS03req3WChy4CYEm0ni
	8sNbbO12BBp42t9yXdTp+Ini+ClKjaNaFYJJSGZ1iVklpWjRAHgzyJ01kryQTTFhs/G6fgNuHeM
	Oh49NXAbU=
X-Google-Smtp-Source: AGHT+IErgj9k47iHzT+YmGC0LfLZHIoat3MoqHvusUt+7FYyCzEWDFBX/lxjtzSHOoyVtJRSWdKzHg==
X-Received: by 2002:a05:622a:14cb:b0:4ed:b6aa:ee26 with SMTP id d75a77b69052e-4efbdaef286mr71667571cf.55.1764124144144;
        Tue, 25 Nov 2025 18:29:04 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e46a0a9sm138397946d6.17.2025.11.25.18.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 18:29:03 -0800 (PST)
Date: Tue, 25 Nov 2025 21:26:46 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] rust_binder: use bitmap for allocation of handles
Message-ID: <aSZlZu0SNycNvk4q@yury>
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
 <20251125-binder-bitmap-v6-6-dedaf1d05a98@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125-binder-bitmap-v6-6-dedaf1d05a98@google.com>

On Tue, Nov 25, 2025 at 01:59:42PM +0000, Alice Ryhl wrote:
> To find an unused Binder handle, Rust Binder currently iterates the
> red/black tree from the beginning until it finds a gap in the keys. This
> is extremely slow.
> 
> To improve the performance, add a bitmap that keeps track of which
> indices are actually in use. This allows us to quickly find an unused
> key in the red/black tree.
> 
> For a benchmark, please see the below numbers that were obtained from
> modifying binderThroughputTest to send a node with each transaction and
> stashing it in the server. This results in the number of nodes
> increasing by one for every transaction sent. I got the following table
> of roundtrip latencies (in µs):
> 
> Transaction Range │ Baseline (Rust) │ Bitmap (Rust) │ Comparison (C)
> 0 - 10,000        │          176.88 │         92.93 │          99.41
> 10,000 - 20,000   │          437.37 │         87.74 │          98.55
> 20,000 - 30,000   │          677.49 │         76.24 │          96.37
> 30,000 - 40,000   │          901.76 │         83.39 │          96.73
> 40,000 - 50,000   │         1126.62 │        100.44 │          94.57
> 50,000 - 60,000   │         1288.98 │         94.38 │          96.64
> 60,000 - 70,000   │         1588.74 │         88.27 │          96.36
> 70,000 - 80,000   │         1812.97 │         93.97 │          91.24
> 80,000 - 90,000   │         2062.95 │         92.22 │         102.01
> 90,000 - 100,000  │         2330.03 │         97.18 │         100.31
> 
> It should be clear that the current Rust code becomes linearly slower
> per insertion as the number of calls to rb_next() per transaction
> increases. After this change, the time to find an ID number appears
> constant. (Technically it is not constant-time as both insertion and
> removal scan the entire bitmap. However, quick napkin math shows that
> scanning the entire bitmap with N=100k takes ~1.5µs, which is neglible
> in a benchmark where the rountrip latency is 100µs.)
> 
> I've included a comparison to the C driver, which uses the same bitmap
> algorithm as this patch since commit 15d9da3f818c ("binder: use bitmap
> for faster descriptor lookup").

Thanks for the solid numbers!

> This currently checks if the bitmap should be shrunk after every
> removal. One potential future change is introducing a shrinker to make
> this operation O(1), but based on the benchmark above this does not seem
> required at this time.
> 
> Reviewed-by: Burak Emir <bqe@google.com>
> Acked-by: Carlos Llamas <cmllamas@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 64 ++++++++++++++++++++++++++++-----------
>  1 file changed, 47 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index f13a747e784c84a0fb09cbf47442712106eba07c..9264961fd92b33c07fcd5353740cc0b1ec978afd 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -19,6 +19,7 @@
>      cred::Credential,
>      error::Error,
>      fs::file::{self, File},
> +    id_pool::IdPool,
>      list::{List, ListArc, ListArcField, ListLinks},
>      mm,
>      prelude::*,
> @@ -367,6 +368,8 @@ impl ListItem<{Self::LIST_NODE}> for NodeRefInfo {
>  struct ProcessNodeRefs {
>      /// Used to look up nodes using the 32-bit id that this process knows it by.
>      by_handle: RBTree<u32, ListArc<NodeRefInfo, { NodeRefInfo::LIST_PROC }>>,
> +    /// Used to quickly find unused ids in `by_handle`.
> +    handle_is_present: IdPool,
>      /// Used to look up nodes without knowing their local 32-bit id. The usize is the address of
>      /// the underlying `Node` struct as returned by `Node::global_id`.
>      by_node: RBTree<usize, u32>,
> @@ -381,6 +384,7 @@ impl ProcessNodeRefs {
>      fn new() -> Self {
>          Self {
>              by_handle: RBTree::new(),
> +            handle_is_present: IdPool::new(),
>              by_node: RBTree::new(),
>              freeze_listeners: RBTree::new(),
>          }
> @@ -775,7 +779,7 @@ pub(crate) fn get_node(
>      pub(crate) fn insert_or_update_handle(
>          self: ArcBorrow<'_, Process>,
>          node_ref: NodeRef,
> -        is_mananger: bool,
> +        is_manager: bool,
>      ) -> Result<u32> {
>          {
>              let mut refs = self.node_refs.lock();
> @@ -794,7 +798,33 @@ pub(crate) fn insert_or_update_handle(
>          let reserve2 = RBTreeNodeReservation::new(GFP_KERNEL)?;
>          let info = UniqueArc::new_uninit(GFP_KERNEL)?;
>  
> -        let mut refs = self.node_refs.lock();
> +        let mut refs_lock = self.node_refs.lock();
> +        let mut refs = &mut *refs_lock;
> +
> +        let (unused_id, by_handle_slot) = loop {
> +            // ID 0 may only be used by the manager.
> +            let start = if is_manager { 0 } else { 1 };
> +
> +            if let Some(res) = refs.handle_is_present.find_unused_id(start) {
> +                match refs.by_handle.entry(res.as_u32()) {
> +                    rbtree::Entry::Vacant(entry) => break (res, entry),
> +                    rbtree::Entry::Occupied(_) => {
> +                        pr_err!("Detected mismatch between handle_is_present and by_handle");
> +                        res.acquire();
> +                        kernel::warn_on!(true);
> +                        return Err(EINVAL);

EINVAL means that user provides a wrong parameter. Here's a data
corruption. Maybe EFAULT?

> +                    }
> +                }
> +            }
> +
> +            let grow_request = refs.handle_is_present.grow_request().ok_or(ENOMEM)?;
> +            drop(refs_lock);
> +            let resizer = grow_request.realloc(GFP_KERNEL)?;
> +            refs_lock = self.node_refs.lock();
> +            refs = &mut *refs_lock;
> +            refs.handle_is_present.grow(resizer);

This continues puzzling me. Refs_lock protects refs, and the spec
says:

    a reference’s scope starts from where it is introduced and
    continues through the last time that reference is used.

https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html

The last usage of refs is at .grow_request() line, because later it's
reused with the new value. 

If my reading of the spec is correct, after dropping the refs_lock,
you may get rescheduled, and another thread may follow the same path.
Because refs_lock is dropped explicitly and refs - implicitly, the
concurrent thread can grab both and follow with resizing the id map.

When your first thread will get back, you'll end up resizing the
already resized map.

I asked your AI, and it says that this race is indeed possible for
exactly that reason. But it doesn't break memory safety, so the
compiler is happy about it...

> +        };
> +        let handle = unused_id.as_u32();
>  
>          // Do a lookup again as node may have been inserted before the lock was reacquired.
>          if let Some(handle_ref) = refs.by_node.get(&node_ref.node.global_id()) {
> @@ -804,20 +834,9 @@ pub(crate) fn insert_or_update_handle(
>              return Ok(handle);
>          }
>  
> -        // Find id.
> -        let mut target: u32 = if is_mananger { 0 } else { 1 };
> -        for handle in refs.by_handle.keys() {
> -            if *handle > target {
> -                break;
> -            }
> -            if *handle == target {
> -                target = target.checked_add(1).ok_or(ENOMEM)?;
> -            }
> -        }
> -
>          let gid = node_ref.node.global_id();
>          let (info_proc, info_node) = {
> -            let info_init = NodeRefInfo::new(node_ref, target, self.into());
> +            let info_init = NodeRefInfo::new(node_ref, handle, self.into());
>              match info.pin_init_with(info_init) {
>                  Ok(info) => ListArc::pair_from_pin_unique(info),
>                  // error is infallible
> @@ -838,9 +857,10 @@ pub(crate) fn insert_or_update_handle(
>          // `info_node` into the right node's `refs` list.
>          unsafe { info_proc.node_ref2().node.insert_node_info(info_node) };
>  
> -        refs.by_node.insert(reserve1.into_node(gid, target));
> -        refs.by_handle.insert(reserve2.into_node(target, info_proc));
> -        Ok(target)
> +        refs.by_node.insert(reserve1.into_node(gid, handle));
> +        by_handle_slot.insert(info_proc, reserve2);
> +        unused_id.acquire();
> +        Ok(handle)
>      }
>  
>      pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult<NodeRef> {
> @@ -905,6 +925,16 @@ pub(crate) fn update_ref(
>                  let id = info.node_ref().node.global_id();
>                  refs.by_handle.remove(&handle);
>                  refs.by_node.remove(&id);
> +                refs.handle_is_present.release_id(handle as usize);
> +
> +                if let Some(shrink) = refs.handle_is_present.shrink_request() {
> +                    drop(refs);
> +                    // This intentionally ignores allocation failures.
> +                    if let Ok(new_bitmap) = shrink.realloc(GFP_KERNEL) {
> +                        refs = self.node_refs.lock();
> +                        refs.handle_is_present.shrink(new_bitmap);
> +                    }
> +                }
>              }
>          } else {
>              // All refs are cleared in process exit, so this warning is expected in that case.
> 
> -- 
> 2.52.0.460.gd25c4c69ec-goog
