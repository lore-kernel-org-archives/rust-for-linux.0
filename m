Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D395A3D6493
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774049857; cv=none; b=D4BIr5bYGyC60wjX4xqgFd4d28aquIgPu9sWqSM0Hxw8FaBRnZ3EnNG1hQ+Q2qm090MmGOLylBmhFkzHP6xvZ5TtXGAQ28tiMJMilw0iwY3nfsDLtz6W71zp+u3fQwG6chRnC7HvVYoyHNbXYnsvQLXGl5xYDfFk9Y/WoVUDqEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774049857; c=relaxed/simple;
	bh=95XhE2vRHmBj7zOhUcC79nWX/DO2ady9qpvytGf4Qi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=EeyEe0AicJFWfiquCDCdXO38HFADncanSZS2bm7WSYAij9JsCNC+kyEjoo1UA8+AodT4GWzf6gm6u/XZiqfBdN7VJuGzRJM2YwXcJGgT+aHmjlOZHN65S48imohD9FWM0oC5uNuHtezJUUIuirsyIl2m8DkubpStQYW7Pgsxlew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MN9GgyQ4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MN9GgyQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774049854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QouNEtmlaggCaQo2P5IO63zf/LsG/YgCtk54rapeiQI=;
	b=MN9GgyQ4AbE/dDxlT60H9zo8XC+5eWr6Eriz4j4kJ5xXF5qdWYF8qP5drAtLXhgFDB3paO
	Pdd7kUbKPjhkJ7s5VWNr4GepkI6df7I5PJ3bjMYLP9WCmebS4JjDhZlqqy2mmNpi73b1Q3
	yxtdUznOXke1XKoURM99o2wShD162zQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-4f6-IlVUOOmiogtqN-RcXA-1; Fri,
 20 Mar 2026 19:37:30 -0400
X-MC-Unique: 4f6-IlVUOOmiogtqN-RcXA-1
X-Mimecast-MFC-AGG-ID: 4f6-IlVUOOmiogtqN-RcXA_1774049848
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B695F19560A2;
	Fri, 20 Mar 2026 23:37:28 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 66852180075C;
	Fri, 20 Mar 2026 23:37:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	nouveau@lists.freedesktop.org,
	"Gary Guo" <gary@garyguo.net>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"David Airlie" <airlied@gmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v6 4/5] rust/drm/gem: Add DriverAllocImpl type alias
Date: Fri, 20 Mar 2026 19:34:29 -0400
Message-ID: <20260320233645.950190-5-lyude@redhat.com>
In-Reply-To: <20260320233645.950190-1-lyude@redhat.com>
References: <20260320233645.950190-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: OwNHubfPULut7q84ZAQCqp-HssrkypxJ3701PeGYOlk_1774049848
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is just a type alias that resolves into the AllocImpl for a given
  T: drm::gem::DriverObject

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/gem/mod.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index b4199945db378..ad74c5159f725 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -33,6 +33,11 @@
 /// [`DriverFile`]: drm::file::DriverFile
 pub type DriverFile<T> = drm::File<<<T as DriverObject>::Driver as drm::Driver>::File>;
 
+/// A type alias for retrieving the current [`AllocImpl`] for a given [`DriverObject`].
+///
+/// [`Driver`]: drm::Driver
+pub type DriverAllocImpl<T> = <<T as DriverObject>::Driver as drm::Driver>::Object;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
@@ -42,12 +47,12 @@ pub trait DriverObject: Sync + Send + Sized {
     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
-    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
+    fn open(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) {}
+    fn close(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) {}
 }
 
 /// Trait that represents a GEM object subtype
-- 
2.53.0

