Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7997225D6
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 10:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947874; cv=none; b=AUObGNAbhEitYFsPL+O6p7ZsyVyeq0d8gPta745KoeYnIZreQkNVOylZL8Qyz+JbnI5eoOCsnlIir/VueGPVqbWVcvi838/4kLeaSk1jvr2sIuhiS8yv7lgvVUem7P7VJvbC8ONDGBW9bTxgHeLDdGfzxe1wJvQ8l7biE4J+puM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947874; c=relaxed/simple;
	bh=TCTXQVW/fEbNmXGvTjoJwZUmhTa2z0NjHq85fpGlYb4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rNgSZ6hdKiSWokjGIZHz3WmxMgCwbmST3qUbBLm++EmnVRSUKovDtwplZCms8nifQSWhvZMJ3+jvqXserGDDwTre/CvnS3jmE0PaZHvO6wJT1JpB9T7cprifCoFkzuyFii6/dvOovv/JoAkkeOgFQCTdYtbfOtlXcs5rzlbRg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ViB1UJUi; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ViB1UJUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741947865; x=1742207065;
	bh=jGEAWdujx7W4XOVxrI3UwJKLthz7vEC+BPID6oM7qzA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ViB1UJUicDyfqcN24sgOwmJ7aODGViIsovYDV2M9Kxxd99XOmW0eO+2KYQc7bD7e9
	 N718kl6Ui/ANT+P+o5I9fv2dmYeAp1gdSlG4SGNGdg3GDr8l3bdE9Pkhmj5+QixQ16
	 exTyT18FnWDxm1EgsKPzN/bXcIlvZ8rxve4A6xt+0JUXcLYpdRMDC9BmoFKgxdwmKY
	 OWfAHNFIsl+xjYxK2DME2lYERKEOUZu3NOt7Q7i6b2Czh6W/drdEwBp0iOe/Uq/E9S
	 YIlpkXb+Ofn7H+fd9fnbyZqFiH7DfTERwqwBwlYtGUkTtex+SbdhdXSjIGAci/lfMo
	 UVtaW59iXROCw==
Date: Fri, 14 Mar 2025 10:24:19 +0000
To: Antonio Hickey <contact@antoniohickey.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/3] rust: use &raw [mut] place instead of addr_of[_mut]!(place)
Message-ID: <D8FWZ8FB4LSE.NL9FTU3PGAFY@proton.me>
In-Reply-To: <0100019592c224ba-0cf38e16-2aa2-459d-99cd-09a463d616d4-000000@email.amazonses.com>
References: <010001958dfeacb5-9039aaab-6114-494a-9f1d-f13982091169-000000@email.amazonses.com> <0100019592c224ba-0cf38e16-2aa2-459d-99cd-09a463d616d4-000000@email.amazonses.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: fa253aed876fdf106c977cafb4cd96ad46c1fffe
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Mar 14, 2025 at 4:45 AM CET, Antonio Hickey wrote:
> This patch set enables the `raw_ref_op` feature, which became stable in
> Rust 1.82. It then adds the previous macros for getting a raw pointer to =
a
> place to the disallowed macros in `.clippy.toml`. Finally it replaces
> all occurences of `addr_of!(place)` and `addr_of_mut!(place)` with=20
> `&raw const place` and `&raw mut place`.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
>
>
> Antonio Hickey (3):
>   rust: enable `raw_ref_op` feature
>   rust: clippy: disable `addr_of!` and `addr_of_mut` macros
>   rust: replace `addr_of[_mut]!` with `&raw [mut]`
>
>  .clippy.toml                           |  4 ++++
>  rust/kernel/block/mq/request.rs        |  4 ++--
>  rust/kernel/faux.rs                    |  4 ++--
>  rust/kernel/fs/file.rs                 |  2 +-
>  rust/kernel/init.rs                    |  8 ++++----
>  rust/kernel/init/macros.rs             | 28 +++++++++++++-------------
>  rust/kernel/jump_label.rs              |  4 ++--
>  rust/kernel/kunit.rs                   |  4 ++--
>  rust/kernel/lib.rs                     |  2 ++
>  rust/kernel/list.rs                    |  2 +-
>  rust/kernel/list/impl_list_item_mod.rs |  6 +++---
>  rust/kernel/net/phy.rs                 |  4 ++--
>  rust/kernel/pci.rs                     |  4 ++--
>  rust/kernel/platform.rs                |  4 +---
>  rust/kernel/rbtree.rs                  | 22 ++++++++++----------
>  rust/kernel/sync/arc.rs                |  2 +-
>  rust/kernel/task.rs                    |  4 ++--
>  rust/kernel/workqueue.rs               |  8 ++++----
>  18 files changed, 60 insertions(+), 56 deletions(-)

Usually when sending a new version, you send it as its own email thread.
That way it's easier to distinguish the two versions. (no need to resend
now, but for the future)

---
Cheers,
Benno

