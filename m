Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4011DBB3A;
	Thu, 16 Jan 2025 13:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032726; cv=pass; b=RgcJPHgMQXjjwKW1PGJNw0UZ2mIMeencS+mXSPeisv+YcHLskTnQY0NrWq8glUGoD9AyFJ8zqYoJEbn7XVRHMzHdXnqH06PmQ+QOpKk8gOAfgaVIanpDgODZUpzkqclY04K2Qu/eL3wfLpCorq0eEGiPScGlqeB3U5l5LZHVl2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032726; c=relaxed/simple;
	bh=bO9dr0NHjG4+GYkcSnjjinWCQq1IiEVNQUZXEbCeCAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=af+zK9g6cmdDy0IxVIHHCcojcAcT+pe26VUBNjG/ZzIkAQr+dkyouz1cokAFHiSd1FtqhjfyMNHp8OWbMXN+VrYjPrvU+weCrUWGvMvtCjdxExSpzxA6EQ8Mnmx1luXtuqU26aiUYokW4sbSQqelOuz5WSEVzddOZEw+YkC4X/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=TKxoWhKH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TKxoWhKH"
ARC-Seal: i=1; a=rsa-sha256; t=1737032709; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zf6WvWo2Fy4mDxrnsUjKklK+h9Q3xlnJiaXPK80CytXXmiG7hJKPaml+Cw9/1/PDkE1n2YLEWkhu/Jsj54E6DPxnS9HiQCEdnDsgQoOD8VLKcAH+YuMs657eb8PJrKwNesui4mQnM73qFa68r/6q+7G0X9FCLyRrvOfhEHhwoGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737032709; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z/JsH7ar+beFrQAVET27B2gZx3QA+MLdTasQKsjE6cU=; 
	b=AwVrPjYGGOie5UCkXPuLorTsVdAFOtNUXU30bBgGaIWotM8H6hcnHFooKgtN2VEjXgQ8tHTQ7fj6jWYfom6ZW+/6zfx0zDU/oWzBQZJrmU7XF+Rzc+wtoEj/8duuSd04eN1qq5UmeYcrQLlwV2PwgDKmCPhJOY0V74awOr8iuL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737032709;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Z/JsH7ar+beFrQAVET27B2gZx3QA+MLdTasQKsjE6cU=;
	b=TKxoWhKHW+c54nTaSiPi3jZmJT0hhdKuvHi4u7rFtnHvqDOr6kK57mJxvfKa4D//
	Xcb5pS5lQenGMIg8D700nJebOTdtBH2kFiqI/B6gFUNOsonTWfIK9rCWfJREljbHlCU
	/0Uag0t0qkhZ1XmHogaz8+06tSZ94SZGpA1NwuPY=
Received: by mx.zohomail.com with SMTPS id 1737032706703772.5466433825862;
	Thu, 16 Jan 2025 05:05:06 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.mco,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	boris.brezillon@collabora.com,
	robh@kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v5 0/3] rust: platform: add Io support
Date: Thu, 16 Jan 2025 09:56:23 -0300
Message-ID: <20250116125632.65017-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Changes in v5:

- resend v5, as the r4l list was not cc'd
- use srctree where applicable in the docs (Alice)
- Remove 'mut' in Resource::from_ptr() (Alice)
- Add 'invariants' section for Resource (Alice)
- Fix typos in mem.rs (Alice)
- Turn 'exclusive' into a const generic (Alice)
- Fix example in platform.rs (Alice)
- Rework the resource.is_null() check (Alice)
- Refactor IoMem::new() to return DevRes<IoMem> directly (Danilo)

link to v4: https://lore.kernel.org/rust-for-linux/20250109133057.243751-1-daniel.almeida@collabora.com/

Changes in v4:

- Rebased on top of driver-core-next
- Split series in multiple patches (Danilo)
- Move IoMem and Resource into its own files (Danilo)
- Fix a missing "if exclusive {...}" check (Danilo)
- Fixed the example, since it was using the old API (Danilo)
- Use Opaque in `Resource`, instead of NonNull and PhantomData (Boqun)
- Highlight that non-exclusive access to the iomem might be required in some cases
- Fixed the safety comment in IoMem::deref()

Link to v3: https://lore.kernel.org/rust-for-linux/20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com/

Changes in v3:
- Rebased on top of v5 for the PCI/Platform abstractions
- platform_get_resource is now called only once when calling ioremap
- Introduced a platform::Resource type, which is bound to the lifetime of the
 platform Device
- Allow retrieving resources from the platform device either by index or
 name
- Make request_mem_region() optional
- Use resource.name() in request_mem_region
- Reword the example to remove an unaligned, out-of-bounds offset
- Update the safety requirements of platform::IoMem

Changes in v2:
- reworked the commit message
- added missing request_mem_region call (Thanks Alice, Danilo)
- IoMem::new() now takes the platform::Device, the resource number and
 the name, instead of an address and a size (thanks, Danilo)
- Added a new example for both sized and unsized versions of IoMem.
- Compiled the examples using kunit.py (thanks for the tip, Alice!)
- Removed instances of `foo as _`. All `as` casts now spell out the actual
 type.
- Now compiling with CLIPPY=1 (I realized I had forgotten, sorry)
- Rebased on top of rust-next to check for any warnings given the new
 unsafe lints.

Daniel Almeida (3):
  rust: io: add resource abstraction
  rust: io: mem: add a generic iomem abstraction
  rust: platform: allow ioremap of platform resources

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/io.c               |  17 ++++++
 rust/kernel/io.rs               |   3 +
 rust/kernel/io/mem.rs           |  98 +++++++++++++++++++++++++++++
 rust/kernel/io/resource.rs      |  53 ++++++++++++++++
 rust/kernel/platform.rs         | 105 +++++++++++++++++++++++++++++++-
 6 files changed, 276 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/io/mem.rs
 create mode 100644 rust/kernel/io/resource.rs

-- 
2.48.0

