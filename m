Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20B926AE5;
	Thu, 27 Aug 2026 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787792752; cv=pass; b=dXTGz2lbAUpv1GZSiRv0FCmtUMcrvNFN6GdtWXtVsY0JVHzSY60PRcFibRH7QulZ1sAFEC+98JzV2x+HhpZwrYDzAa80cuaYJv5VO2FxrTe4h+FbqNJSKVCrcBOvIgqYXxSM5d8tNCwKTJ9POdJBi6vo8Fg4C9GYNW+3ko1QgOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787792752; c=relaxed/simple;
	bh=lpJQoX6pWHH5sYuTcueC2U5YpoLXynrPHft3/19Vk7k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Lw0FGEa5F2sYztTvX7HOFeJCFsvsf8DVcbjv6bSy3h86ToB8vC0wD7HQ6xRJVLX5R0rytox/WGyQZlPGEseSMUgYHn9mJ0T8YajV0Hlxr0nwDC91r6SRmubnapUNNktZNyjp0aLSfvfjoZsiSMrcobCKl6X7Kr003GkmtcW6hZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=DWEXHiJs; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="DWEXHiJs"
ARC-Seal: i=1; a=rsa-sha256; t=1787792677; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iNv68hOXy8S7ZcQaEJoc5roSJ9+oQzwD43B7H7tZCEd2Lhrp/NcDgIQzVvyGnXNvV+9dUAULJp2z+T1bYEjZyhjMhxPFvaAU8DZ64ZH576vIecbOCMSxYvBQkNvbYkSd2z1pZaFfd6CmraInq3mo+762kHbRvp6l+fQMjTZLESA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787792677; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2WO3BY8DIwFx+wgH7vWUtD3dKtC272CjNsPfBc4W8Ys=; 
	b=ZA0VstXJ1yIzmby+vrc/i04yTI4D5759dPp/hkdA+nhi9lCyMSzSSqOxWNv/Fi3Aa00tnk7N6KtrUi1vvxd2L76Os9V/qFaOp/MxBcUqXO7EwweriqHxqvMAts9HFOEIty/Y7CJp+HBF73T+RSQbCGl7mkE/jXumtHHRMIH/91Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787792677;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=2WO3BY8DIwFx+wgH7vWUtD3dKtC272CjNsPfBc4W8Ys=;
	b=DWEXHiJsGxIzW/OzDZQ7aLFj7sBantDs0M8/OuLcYZn2yPI5XKi2YEHpPsQjnSp6
	ivA3rA1j2CEVU4tsWR9EKyz9j5IcVtbHyIlvkPEc9Km5A4qruykgNlVt2Nb2uOOloQo
	UIU2vTF09fVE6Lv6e/k6ZWUC8u3dc7lUx7tw3Kh4=
Received: by mx.zohomail.com with SMTPS id 1787792674559445.2342580425427;
	Wed, 26 Aug 2026 18:04:34 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 05/11] rust: xarray: simplify `Guard::load`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260604-xarray-entry-send-v4-5-965f6028790e@kernel.org>
Date: Wed, 26 Aug 2026 22:04:15 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Tamir Duberstein <tamird@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Harry Yoo <harry@kernel.org>,
 Hao Li <hao.li@linux.dev>,
 Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: 7bit
Message-Id: <4F8ADE4F-057E-48FB-9C7F-838EE4B0314E@collabora.com>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-5-965f6028790e@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 4 Jun 2026, at 16:58, Andreas Hindborg <a.hindborg@kernel.org> wrote:
> 
> Simplify the implementation by removing the closure-based API from
> `Guard::load` in favor of returning `Option<NonNull<c_void>>` directly.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> rust/kernel/xarray.rs | 23 +++++++++--------------
> 1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 05e6dc1ffe69..7da57c778669 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -212,28 +212,23 @@ fn from(value: StoreError<T>) -> Self {
> }
> 
> impl<'a, T: ForeignOwnable> Guard<'a, T> {
> -    fn load<F, U>(&self, index: usize, f: F) -> Option<U>
> -    where
> -        F: FnOnce(NonNull<c_void>) -> U,
> -    {
> -        let mut state = XArrayState::new(self, index);
> -        Some(f(state.load()?))
> +    fn load(&self, index: usize) -> Option<NonNull<c_void>> {
> +        XArrayState::new(self, index).load()
>     }
> 
>     /// Provides a reference to the element at the given index.
>     pub fn get(&self, index: usize) -> Option<T::Borrowed<'_>> {
> -        self.load(index, |ptr| {
> -            // SAFETY: `ptr` came from `T::into_foreign`.
> -            unsafe { T::borrow(ptr.as_ptr()) }
> -        })
> +        let ptr = self.load(index)?;
> +        // SAFETY: `ptr` came from `T::into_foreign`.
> +        Some(unsafe { T::borrow(ptr.as_ptr()) })
>     }
> 
>     /// Provides a mutable reference to the element at the given index.
>     pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
> -        self.load(index, |ptr| {
> -            // SAFETY: `ptr` came from `T::into_foreign`.
> -            unsafe { T::borrow_mut(ptr.as_ptr()) }
> -        })
> +        let ptr = self.load(index)?;
> +
> +        // SAFETY: `ptr` came from `T::into_foreign`.
> +        Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
>     }
> 
>     /// Removes and returns the element at the given index.
> 
> -- 
> 2.51.2
> 
> 
> 

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

