Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD5287507
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979765; cv=none; b=OquKJm7mP/8RtNZAq3PkX9SjPu8QypyKvzVsa7he+36SnNKrGU9QHVMLqF9JX60fNx9WDxkqbPy4KKlOLr9n877KwvXk9zZrX3fhmK5QMqY5GZFE3uC+SzBh7DKyDxdyEfgprh+ULWGKbliGBUSWC81bzZjC0aE7Dqf58ueUH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979765; c=relaxed/simple;
	bh=kMtr8rxMNB8DiOzifUqvwMtBN3H+SuqhXgD87exLlow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ij/EMbrojyl2YTeeJS79iDPgGfgYGxO3isBp6zSzfVePJoGQilDJBkJOEzaFs8Uq8wVh0tPy2Rb8o2B11awb52yR01/q5eLm6FxagZCVGVhFrLOtOKkvLQoUrEAMxw13Vc2oeRQ0JfgXjFzbk/N5J8yU50a4EdKOTgryOu7YoYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T3Uffm6W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T3Uffm6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760979762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60e0IVore7boCdNupv+ILyCAnntv+WCulzbwmbp4u7k=;
	b=T3Uffm6WxzY+Nr8+bWEt2h4yTfWkU7BQYk/ngFP3aPrqt+mh2WYxkoZw3fpiPZ8ZRRZRSi
	rCpikPoQ0MXqL9uO1FChrHYjRfCMQUaTp9nocKIiuEIqwukaS2JrnHEM5zufr3427bijGK
	tHGo9tOrr7aLxw+xeolvw+DZpbXir/M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-DsFKj0z2MuG5BFW5j8FDMw-1; Mon, 20 Oct 2025 13:02:41 -0400
X-MC-Unique: DsFKj0z2MuG5BFW5j8FDMw-1
X-Mimecast-MFC-AGG-ID: DsFKj0z2MuG5BFW5j8FDMw_1760979761
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88ec911196aso1783425785a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 10:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979761; x=1761584561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60e0IVore7boCdNupv+ILyCAnntv+WCulzbwmbp4u7k=;
        b=dOCIX7zOCgnykiqEWSmUgkf2gWMg3kW6z9+W8m5Fikhh5zoEfly4Kp03PiXj8/1yfM
         QX0KRb0LWLC7UaxK3LTTVate5aOGu3olHtmKh5G57iQo/4jqySZFnKRvhVFh9aDUomg8
         TB3B/4JKELY0jrHBmpQj9FauWcK6gc53CTjQzC4E2/K2QxBrbSkX0dvFFFwDKqjjbPZ2
         IJfiiCcGxaxw5Vbpbx4rHiYGKr48/je0lbwm17wNxSf3Zc9z3y/KVi/fyEH5gyzIj8f+
         VEKR31TTY901rOUtSswsRgx0TlPJazopygrAWGlJSdeVwQTxBtXzuaiJw21x32wpk/0V
         tuiw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9agqT51d7WQ8AUpajIe29CTF4sc4/udg86b3B9OmkNmMhwabbjCXpk/o7SxzRzKUmwhuUS/vaOZpHh1jZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFnHpEgYQBMXkw1qAJFT2YpuS2GLqdh/bMpwLVa2D1nPpzgkGM
	zfYJ8Lru6dD8KO+OGikXy3/GjzOrosC9axGR2287X6JaOXRrEIKrKoIgfpEumxC7jzXYUrKRAG4
	TjmZQnBrFV3EeNrtpDkZUlzE8g3513ClDKaKwT6OcqKyIWEn3ggdMSk805zPcmTGZfrNz
X-Gm-Gg: ASbGncs82BsLB/M4zyd3J+YzFNjaRrZ7Yo3Jc3pf2sjIzmouqQReVmJP5L9JjitjfA4
	ZNd/omYqYbm99EJiKexT33YAYAT26EYLj2+Vt1M8kbioO8q8NoHuex4xxnE+efYRw4tIQBkrt9L
	3qYIO8+eRVyniEWIcl0xol1bdcGH3t2iSWfDbl5ZGbreFriNSZ38ERmigXMguP7T2X+yVlxbyoo
	ByYmEDs8ivDo76Dfkb3Xj5zvEMV/c1OtierjGXDnwHvYKpsvim53TdvGQww5WUusbqg4t3oEUrH
	ssrqa/R4HdlD1rZsKU+m3jgwUrInAQmPH9HKeWFt/5BAFK7KCnNxzQ+7f5SHpxpobrikg/zE5e3
	AD+Jg7ryWNfEe
X-Received: by 2002:ac8:7d0c:0:b0:4e8:ad2a:b0d8 with SMTP id d75a77b69052e-4e8ad2adf32mr111401351cf.30.1760979761229;
        Mon, 20 Oct 2025 10:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwVmn9czv79qyCwEl1SriY3PLMsY5z230eFIqxhHynrytOJV25/qzzTjQIcPMDVhjxQP5Qw==
X-Received: by 2002:ac8:7d0c:0:b0:4e8:ad2a:b0d8 with SMTP id d75a77b69052e-4e8ad2adf32mr111400681cf.30.1760979760572;
        Mon, 20 Oct 2025 10:02:40 -0700 (PDT)
Received: from mira.orion.internal ([2607:f2c0:b0fc:be00:3640:bdf5:7a8:2136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cf58eecbsm589945985a.49.2025.10.20.10.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:02:40 -0700 (PDT)
From: Peter Colberg <pcolberg@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Colberg <pcolberg@redhat.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v2 2/2] rust: pci: normalise spelling of PCI BAR
Date: Mon, 20 Oct 2025 17:02:23 +0000
Message-ID: <20251020170223.573769-3-pcolberg@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020170223.573769-1-pcolberg@redhat.com>
References: <20251020170223.573769-1-pcolberg@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MAkjEKqS2_q8E2UeHp7EBYWKQ3uiYEFcXJyFR2WOL0A_1760979761
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Consistently refer to PCI base address register as PCI BAR.
Fix spelling mistake "Mapps" -> "Maps".

Link: https://lore.kernel.org/rust-for-linux/20251015225827.GA960157@bhelgaas/
Link: https://github.com/Rust-for-Linux/linux/issues/1196
Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
v2:
- Rebase onto driver-core-testing to follow "Rust PCI housekeeping"
  patches, which move I/O and IRQ specific code into sub-modules.
---
 rust/kernel/pci.rs    | 4 ++--
 rust/kernel/pci/io.rs | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index ce612c9b7b56..3100d37eba2b 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -377,7 +377,7 @@ pub fn subsystem_device_id(&self) -> u16 {
         unsafe { (*self.as_raw()).subsystem_device }
     }
 
-    /// Returns the start of the given PCI bar resource.
+    /// Returns the start of the given PCI BAR resource.
     pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {
             return Err(EINVAL);
@@ -389,7 +389,7 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
-    /// Returns the size of the given PCI bar resource.
+    /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {
             return Err(EINVAL);
diff --git a/rust/kernel/pci/io.rs b/rust/kernel/pci/io.rs
index 65151a0a1a41..3684276b326b 100644
--- a/rust/kernel/pci/io.rs
+++ b/rust/kernel/pci/io.rs
@@ -18,7 +18,7 @@
 /// # Invariants
 ///
 /// `Bar` always holds an `IoRaw` inststance that holds a valid pointer to the start of the I/O
-/// memory mapped PCI bar and its size.
+/// memory mapped PCI BAR and its size.
 pub struct Bar<const SIZE: usize = 0> {
     pdev: ARef<Device>,
     io: IoRaw<SIZE>,
@@ -78,7 +78,7 @@ pub(super) fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
 
     /// # Safety
     ///
-    /// `ioptr` must be a valid pointer to the memory mapped PCI bar number `num`.
+    /// `ioptr` must be a valid pointer to the memory mapped PCI BAR number `num`.
     unsafe fn do_release(pdev: &Device, ioptr: usize, num: i32) {
         // SAFETY:
         // `pdev` is valid by the invariants of `Device`.
@@ -120,7 +120,7 @@ fn deref(&self) -> &Self::Target {
 }
 
 impl Device<device::Bound> {
-    /// Mapps an entire PCI-BAR after performing a region-request on it. I/O operation bound checks
+    /// Maps an entire PCI BAR after performing a region-request on it. I/O operation bound checks
     /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
     pub fn iomap_region_sized<'a, const SIZE: usize>(
         &'a self,
@@ -130,7 +130,7 @@ pub fn iomap_region_sized<'a, const SIZE: usize>(
         Devres::new(self.as_ref(), Bar::<SIZE>::new(self, bar, name))
     }
 
-    /// Mapps an entire PCI-BAR after performing a region-request on it.
+    /// Maps an entire PCI BAR after performing a region-request on it.
     pub fn iomap_region<'a>(
         &'a self,
         bar: u32,
-- 
2.51.0

