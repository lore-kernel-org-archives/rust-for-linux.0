Received: from sender4-pp-f119.zoho.com (sender4-pp-f119.zoho.com [136.143.188.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F3C36EAB3;
	Tue, 17 Feb 2026 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771358060; cv=pass; b=OcWcBu82hr7xGEiWQyuLmPugKcQeUOU91WmCGRh0rX++2XaGjiGopbixhNNTm037aQLKbQdE8JFwCkZJQJBiy0HVHLj8elu8iPs2ETHAdnpbbVRK1ldgdDGUDVQhp1o264Ox05t61Rtoi4e0d3WgPeEsKmC2wmEGYlMs+MXq70o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771358060; c=relaxed/simple;
	bh=Od07ogukdoK1EkexdcYxAzwb4jxNLj03aCfVoVZW//0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ewDQm4LjSNZ6hCJSBcRAfRAjfLO25HjR6/T6Hl8Bau54egmSYZcSi5RVKuzgK1a5ovuxzBzCPmBvCkg7KTFEqCbOg7OB1r0X5FRAVD/I+XJUQr3xOyKyF5+7jh4Zyq7n+d7j6/bHJmhZ3iF6VvL5PTo4ZgWBuNzuzgni843Drmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=BIuD1Xks; arc=pass smtp.client-ip=136.143.188.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BIuD1Xks"
ARC-Seal: i=1; a=rsa-sha256; t=1771358042; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IZkPQy0Wik5rusuc4aV5B+jj0MB29fyUbs7pP71qFNHoO0oyqwqttjDtQsNv3c93JLN+JtwIZOTlU0D/rurWQKAsjeFcaKYB4F1Uml9m5Tyxbhahe6cHFXvwjfi0FM/BY2eSJ53hrIYEmBCG6mDIsCj4tuJOrQhRZPNo8GsjNY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771358042; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yNZugCRDEKYVk22Dh/+iA3R9vz8Imiqc3mNY11FG0x8=; 
	b=hM0+aQV0V1j77EEsy4U9UmNgGLxSQQYdTYEWKwaxiYjqCLbAyrMwjVe4+sXTlQRAd72kRslWM7wTw/7s7jXLJKhVWaqUUtVJlVH+NW2kflkWK5FgyPVp1GPRIRSc1+ZNWZwboyDXgg/4lyzwsHIIrtsA3ajZdyx//8E63Jv5X3A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771358042;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=yNZugCRDEKYVk22Dh/+iA3R9vz8Imiqc3mNY11FG0x8=;
	b=BIuD1XksshXGnfiD1sllUBw1cr1wQM6CmsE6FN5FeiPnZDqiy99OrdIh/7zMrAwY
	tb463WGExPPYsBoB4QlX8M3heTsHFYEDEzlZTYukbUu9s+/e1eALNbYyyMCzbkbH/e7
	jRx53bSfL7LuZC63Q7Bjz2GwqP3zabX5h8AoVFWY=
Received: by mx.zohomail.com with SMTPS id 1771358037932727.3027003579033;
	Tue, 17 Feb 2026 11:53:57 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 5/7] rust: drm: gem: Introduce shmem::SGTable
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260206223431.693765-6-lyude@redhat.com>
Date: Tue, 17 Feb 2026 16:53:41 -0300
Cc: linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9442F3C0-AC21-4AC2-9D8A-352424144999@collabora.com>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-6-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 6 Feb 2026, at 19:34, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Currently we expose the ability to retrieve an SGTable for an shmem =
gem
> object using gem::shmem::Object::<T>::sg_table(). However, this only =
gives
> us a borrowed reference. This being said - retrieving an SGTable is a
> fallible operation, and as such it's reasonable that a driver may want =
to
> hold onto an SGTable for longer then a reference would allow in order =
to
> avoid having to deal with fallibility every time they want to access =
the
> SGTable. One such driver with this usecase is the Asahi driver.
>=20
> So to support this, let's introduce shmem::SGTable - which both holds =
a
> pointer to the SGTable and a reference to its respective GEM object in
> order to keep the GEM object alive for as long as the shmem::SGTable. =
The
> type can be used identically to a normal SGTable.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Janne Grunau <j@jananu.net>
>=20
> ---
> V3:
> * Rename OwnedSGTable to shmem::SGTable. Since the current version of =
the
>  SGTable abstractions now has a `Owned` and `Borrowed` variant, I =
think
>  renaming this to shmem::SGTable makes things less confusing.
>  We do however, keep the name of owned_sg_table() as-is.
> V4:
> * Clarify safety comments for SGTable to explain why the object is
>  thread-safe.
> * Rename from SGTableRef to SGTable
>=20
> rust/kernel/drm/gem/shmem.rs | 50 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>=20
> diff --git a/rust/kernel/drm/gem/shmem.rs =
b/rust/kernel/drm/gem/shmem.rs
> index d9f1a4e95cedc..e511a9b6710e0 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -197,6 +197,25 @@ pub fn sg_table(&self) -> =
Result<&scatterlist::SGTable> {
>         // pointer to a scatterlist
>         Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
>     }
> +
> +    /// Creates (if necessary) and returns an owned reference to a =
scatter-gather table of DMA pages
> +    /// for this object.
> +    ///
> +    /// This is the same as [`sg_table`](Self::sg_table), except that =
it instead returns an
> +    /// [`shmem::SGTable`] which holds a reference to the associated =
gem object, instead of a
> +    /// reference to an [`scatterlist::SGTable`].
> +    ///
> +    /// This will pin the object in memory.
> +    ///
> +    /// [`shmem::SGTable`]: SGTable
> +    pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
> +        Ok(SGTable {
> +            sgt: self.sg_table()?.into(),
> +            // INVARIANT: We take an owned refcount to `self` here, =
ensuring that `sgt` remains
> +            // valid for as long as this `SGTable`.
> +            _owner: self.into(),
> +        })
> +    }
> }
>=20
> impl<T: DriverObject> Deref for Object<T> {
> @@ -247,3 +266,34 @@ impl<T: DriverObject> driver::AllocImpl for =
Object<T> {
>         dumb_map_offset: None,
>     };
> }
> +
> +/// An owned reference to a scatter-gather table of DMA address spans =
for a GEM shmem object.
> +///
> +/// This object holds an owned reference to the underlying GEM shmem =
object, ensuring that the
> +/// [`scatterlist::SGTable`] referenced by this type remains valid =
for the lifetime of this object.
> +///
> +/// # Invariants
> +///
> +/// - `sgt` is kept alive by `_owner`, ensuring it remains valid for =
as long as `Self`.
> +/// - `sgt` corresponds to the owned object in `_owner`.
> +/// - This object is only exposed in situations where we know the =
underlying `SGTable` will not be
> +///   modified for the lifetime of this object. Thus, it is safe to =
send/access this type across
> +///   threads.
> +pub struct SGTable<T: DriverObject> {
> +    sgt: NonNull<scatterlist::SGTable>,
> +    _owner: ARef<Object<T>>,
> +}
> +
> +// SAFETY: This object is thread-safe via our type invariants.
> +unsafe impl<T: DriverObject> Send for SGTable<T> {}
> +// SAFETY: This object is thread-safe via our type invariants.
> +unsafe impl<T: DriverObject> Sync for SGTable<T> {}
> +
> +impl<T: DriverObject> Deref for SGTable<T> {
> +    type Target =3D scatterlist::SGTable;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Creating an immutable reference to this is safe =
via our type invariants.
> +        unsafe { self.sgt.as_ref() }
> +    }
> +}
> --=20
> 2.53.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

