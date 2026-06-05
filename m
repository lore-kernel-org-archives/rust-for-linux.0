Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2B540DFDC;
	Fri,  5 Jun 2026 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672537; cv=none; b=cqWaHi9hnnWMYAgZp5bSwPxOlfe4Wzv7BTC0eN95gVS+g8SVpSmOFfcUdzdHsN8BWK6DRlq8PSIKQxUlisBAbdVn5Nffya+Ubvn4iGkWaseE0XqXrcQ1fQ1eHd841W3TtF9txVHYjg8KyVl5GVnZ0Eee+DkPBEOLevNR3Eq854E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672537; c=relaxed/simple;
	bh=0yZ8MNnL/6JmXr7ul0Kx6gDu12++TzJW8JGsu0EE8KQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ooQd8L79eGB/5UzBxQNs3hAKgaqmJKw0Yhs+vsNKN7DV+RUPN04V5PEsORwIZTuva6DHRATa/cufXvTZ1opdl8H72dLSby5F8IvKRmrz4ufBg59zOKOdWYuFoWD95ToNWsv4yFjocUvE3d5GOL3EiXSHZQtrj1drKlb4wMe7z4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAkHgqrh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAkHgqrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8321F00898;
	Fri,  5 Jun 2026 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780672536;
	bh=puhtAJbtTv10DbpMBzxxn4d8tkyueRSzpyS9PIcm/Do=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bAkHgqrhvi63nXp1C7VGteim+y4gX3V6BNOlfGB3MuR/OoTCl95ozYQpmoWVp0o8Z
	 oOOQ5UBAofckRS+WVkyQ01hS2CI9zCdJJ+Ag9+mQkd3X/VqYTcGSc+8l9g361rmSgD
	 S1G5QdXJMzt0GOg1cWWMsTIXMb7Arvfk2DHl4+QBw3SVHcHlKkyXE2uRTbdw/yxSed
	 1glD6bSHdeIlxKCglJydri+dhGRfBiW1XgVuN8ZN2VNEbQifjwUzat8yu74WuUAlGW
	 aUChmd43TXFT/rlxMXAKa2HnVXULJjewyCHp1aK0+qpADq0zq7snXGHOM7MdZY+3Yb
	 rzvz0PfohMfCw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 03/11] rust: xarray: add `XArrayState`
From: Tamir Duberstein <tamird@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Daniel Gomez <da.gomez@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
In-Reply-To: <20260604-xarray-entry-send-v4-3-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-3-965f6028790e@kernel.org>
Date: Fri, 05 Jun 2026 11:15:13 -0400
Message-Id: <178067251345.96312.12627213045914595867.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0yZ8MNnL/6JmXr7ul0Kx6gDu12++TzJW8JGsu0EE8KQ=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKL4S28b9iVNtz/WnUqw+ODBmZC0qWyBXc7e/3/tM6p
 3OVrl5xx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKk2kmb4X+QtM+1rgP7T2VOduqTWLS/YuDz2Y/m+C9dsTFbpdFb1z2RkOKP9o5z
 pe4NU8PPff/U4P99pEHyq3X3zuUnTthl775vrswIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Thu, 04 Jun 2026 21:58:09 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
> Add `XArrayState` as internal state for XArray iteration and entry
> operations. This struct wraps the C `xa_state` structure and holds a
> reference to a `Guard` to ensure exclusive access to the XArray for the
> lifetime of the state object.
> 
> The `XAS_RESTART` constant is also exposed through the bindings helper
> to properly initialize the `xa_node` field.
> 
> The struct and its constructor are marked with `#[expect(dead_code)]` as
> there are no users yet. We will remove this annotation in a later patch.

The review of this patch in v3 requested the next patch be absorbed into
it.

>
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index d54942aeb201..6d0d4905004a 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -299,6 +302,67 @@ pub fn store(
> [ ... skip 17 lines ... ]
> +impl<'a, T: ForeignOwnable> GuardRef for &mut Guard<'a, T> {
> +    type Value = T;
> +    fn xa_ptr(&self) -> *mut bindings::xarray {
> +        self.xa.xa.get()
> +    }
> +}

I'm having a hard time understanding the need for this trait, and it is
not described in the commit message at all. How is this different than
using Deref? `&mut T` has a blanket `Deref<Target = T>` impl.

-- 
Tamir Duberstein <tamird@kernel.org>
