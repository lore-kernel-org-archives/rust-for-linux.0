Received: from sender4-pp-g121.zoho.com (sender4-pp-g121.zoho.com [136.143.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E063543637B;
	Tue, 20 Jan 2026 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919601; cv=pass; b=K09p8jIfgAvL4+OjUSAlRKJ6DPaj6PUp0Cqf8MNOU6BsfpJid2AFqPE8/PZXkVmt0sXFULaJ/iJw+qqDK+t54pVSCljdymVrxyl8T+SFVtsRmXFOyBYT19ORblX1R9cmAk3V/lWh4O/dYUss62xl5Gg6PfbNTQVZenFtEtjCtD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919601; c=relaxed/simple;
	bh=3Zp0t2yMKmr+klAzTiCg7oeBZdk+/yxoP/VYsTaIPGM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Q5PgroHqBbFdo+6CClZws0ZwAjWhzIB7+DZdZaLvSMoBO2KJ8axDbgIpgXXnQw2gfVkLuidxDNuIys7v9C+oAIFGJGREl2+cB58yp/PnYGIRoCnVTUTmscqN2oEfBQNjBboCM/PVjHlOCTnoBAKGYp/lVgke+s2TUfQm4VlXuqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=EjULuGtK; arc=pass smtp.client-ip=136.143.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EjULuGtK"
ARC-Seal: i=1; a=rsa-sha256; t=1768919582; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mwCpXmvp8rNIVts5YWlgz0IMBaa9ZcqDvYV62zFaHXJtmSAYTYeAVpOL87bsfVsg8UAZ/fTmP7Swt9B7D5ynoj6+c62EkeIRJoIcRX4xE7JDpppJvdJ6yG7FI79j6LFSsJ9BVoHNTs1/lt6aqf6lPCDTnusj8g0oAWQY20IpKKw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768919582; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rm6uLsK914Ig8j42ifKzk/cZJnO4sbvc5ycjj39F2So=; 
	b=CAYR8qotVmiJwuXPSvO5MzoChVCEnjL1Yb3EO+captqO43FEJ6IO7a3ZwpACHVs08kvR/RMQBoq8LDEVNyoUjwJ3E5nxoky4P0Iu1kG9YrjaKBU42o28QWhuiyzKy8EakDFp/r6ZdMmbftCmAqfCqwyGDYy61Jq+eWOlXX3Ahgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768919582;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=rm6uLsK914Ig8j42ifKzk/cZJnO4sbvc5ycjj39F2So=;
	b=EjULuGtKrvioZA7uzzORC2u4sUgNoOGc9L1/1bLS/JbFefvAs33UxXWHKuXn7b+9
	sb146YFLgCe/EWHtFK9oNqxhIDBj1PpxPvxU/Rm9yVt/1J62jW58rKmE55ll7i4zV1S
	U7BSWiAYpLShthRLBt2Ve2hWOo3/lu8WtN4Kwtco=
Received: by mx.zohomail.com with SMTPS id 1768919581714913.8193854287318;
	Tue, 20 Jan 2026 06:33:01 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 4/4] rust: drm: dispatch delayed work items to the private
 data
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DFTDFR0943NX.3RTHNQURC11XQ@kernel.org>
Date: Tue, 20 Jan 2026 11:32:45 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6833E564-ED5B-42F4-A0D9-932521AF18DE@collabora.com>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
 <20260115-aref-workitem-v1-4-9883e00f0509@collabora.com>
 <DFTDFR0943NX.3RTHNQURC11XQ@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Danilo,

> On 20 Jan 2026, at 08:14, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Fri Jan 16, 2026 at 1:36 AM CET, Daniel Almeida wrote:
>> +// SAFETY: Our `HasWork<T, ID>` implementation returns a =
`work_struct` that is
>> +// stored in the `work` field of a `delayed_work` with the same =
access rules as
>> +// the `work_struct` owing to the bound on `T::Data: =
HasDelayedWork<Device<T>,
>> +// ID>`, which requires that `T::Data::raw_get_work` return a =
`work_struct` that
>> +// is inside a `delayed_work`.
>> +unsafe impl<T, const ID: u64> HasDelayedWork<Device<T>, ID> for =
Device<T>
>> +where
>> +    T: drm::Driver,
>> +    T::Data: HasDelayedWork<Device<T>, ID>,
>> +{
>> +}
>=20
> What do you intend to do within work that is queued for a DRM device? =
I assume
> you have to access bus device resources?
>=20
> Also, it would be nice to see how this is used in a driver. Can you =
please add a
> patch for Tyr to the series?

Yes, we need resources from the bus device, as need to access the =
underlying
mmio range for register reads and writes. We also need to allocate GEM =
objects
in that path, which requires the drm class device.


I've just pushed a demo with some WIP at [0] for illustration purposes. =
Apart
from the other cruft in that code, the main point is:

- impl WorkItem<2> for TyrData {
-    type Pointer =3D Arc<Self>;
+ impl WorkItem<2> for crate::driver::TyrInlineData {
+    type Pointer =3D ARef<TyrDevice>;

1) The data is now defined inline with the drm::Device. This is used by =
the
work_container_of implementation in commit #2 in this series.

2) This inline data now has the work and an Arc<TyrData> to keep the =
shared
ownership semantics of TyrData, i.e.:

/// Inline data stored directly in the DRM device.
/// Contains work items that need access to the device itself.
#[pin_data]
pub(crate) struct TyrInlineData {
    /// The work to process firmware events (tiler OOM, etc.)
    #[pin]
    pub(crate) fw_events_work: Work<TyrDevice, 2>,

    /// The scheduler tick work
    #[pin]
    pub(crate) tick_work: Work<TyrDevice, 1>,

    /// The actual driver data
    pub(crate) data: Arc<TyrData>,
}

3) When processing a TILER_OOM event, we now have access to =
ARef<TyrDevice>
which lets us allocate more memory to the tiler inside the handler =
routine.

This applies for regular work items, but there is a use-case for delayed =
work
items as well. As we spoke during Kangrejos, Tyr and Panthor have this =
internal
job scheduler that bridges the gap between the outstanding jobs and the =
limited
amount of ring buffers exposed by the firmware. This runs periodically, =
which
is a major use case for delayed work items in Tyr.

This is not implemented in the prototype at the moment, because it's not =
needed
for a demo. We simply reject jobs with -EBUSY if all the firmware slots =
are
full. Sadly, there is not enough upstream at the moment to provide a =
patch that is
actually useful for Tyr itself in this series, but I am sure we will =
eventually
need it. This statement applies to both regular and delayed work items.

I assume you're worried about the device being unbound in the meantime? =
These types
of discussions are precisely why I am submitting this a bit in advance =
:)

By the way, I=E2=80=99d say in any case we should merge patch #1 once =
there=E2=80=99s no more comments,
as implementing ARef support seems to be orthogonal to the issue I =
raised above, unless
you=E2=80=99re worried about something else?

[0]: =
https://gitlab.collabora.com/dwlsalmeida/for-upstream/-/commit/4ac5ec7d8b1=
3d4d4fc5280b414b02ba5ab8e8f23=
