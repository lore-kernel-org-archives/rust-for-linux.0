Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624E1A2842
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 23:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739571; cv=none; b=sEgzIbsysvrD2SlWGH7QKidteVCZxsttT8JRkymsg/Vg4BqFiJptFkf41+mAA5uFbytwzQoS7vEE8rvSvZmmGrpV9+yNlqq3DsB21q68As0KVMeyyHIL7Wuj5FAnSzizHLRwZ+Ao0t/ujR07p2ZWa0hJYaHq/iGglsjm+/uzhEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739571; c=relaxed/simple;
	bh=LfvKo+btOA5fVqsPnba1AmfTz7bhcczZRdPzPyf2S5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAdNMlRJ4LigicdB/IkZntyAxH7W3T1qbZRDQLaqMa33FfxWZtIkvBThTJOexvx+O+idhrYILN3u0dn7SVlsBBpEP0ct616c9omsxz7W/5UkZ8F1aq5BWxkBueq6dxwAR/Ul502dW2riZsKSmdvygo36UqtHDJTYSlUl9LD5F+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VetEv2Hu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VetEv2Hu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727739569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQUtNu2ymV8+ePIE/+uRZptH2R5q5/TOrvKyouxuFHU=;
	b=VetEv2Hu0ZJh/TClieYJfSWotLTlLttetXfeyb6zHSaYJ1LYvG1se6nb6kSKFbbHhhy1V8
	dBSzosRfg0Bl7bo5vu44uOwJS2ZVHTG3omUH0lpyl6WlJgQ9vrdcTv0QDxjCf7tx5Tetpe
	QUSk1GUOflTgsrcDeZJEN52Z94oBwhE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-iOcJtWYwNDCzdFpW_N7r0Q-1; Mon,
 30 Sep 2024 19:39:26 -0400
X-MC-Unique: iOcJtWYwNDCzdFpW_N7r0Q-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0B15196A111;
	Mon, 30 Sep 2024 23:39:23 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98B8B3003DEC;
	Mon, 30 Sep 2024 23:39:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>,
	Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com,
	airlied@redhat.com,
	zhiw@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 16/35] rust: drm/kms: Add RawConnector and RawConnectorState
Date: Mon, 30 Sep 2024 19:09:59 -0400
Message-ID: <20240930233257.1189730-17-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Now that we have more then one way to refer to connectors, we also want to
ensure that any methods which are common to any kind of connector type can
be used on all connector representations. This is where RawConnector and
RawConnectorState come in: we implement these traits for any type which
implements AsRawConnector or AsRawConnectorState respectively.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/connector.rs | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 98ac7fb781d4e..f62740d7f6469 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -331,6 +331,27 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
     }
 }
 
+/// Common methods available on any type which implements [`AsRawConnector`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// connectors.
+pub trait RawConnector: AsRawConnector {
+    /// Return the index of this DRM connector
+    #[inline]
+    fn index(&self) -> u32 {
+        // SAFETY: The index is initialized by the time we expose DRM connector objects to users,
+        // and is invariant throughout the lifetime of the connector
+        unsafe { (*self.as_raw()).index }
+    }
+
+    /// Return the bitmask derived from this DRM connector's index
+    #[inline]
+    fn mask(&self) -> u32 {
+        1 << self.index()
+    }
+}
+impl<T: AsRawConnector> RawConnector for T {}
+
 unsafe extern "C" fn connector_destroy_callback<T: DriverConnector>(
     connector: *mut bindings::drm_connector,
 ) {
@@ -523,6 +544,19 @@ pub trait FromRawConnectorState: AsRawConnectorState {
     unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self;
 }
 
+/// Common methods available on any type which implements [`AsRawConnectorState`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// the atomic state of [`Connector`]s.
+pub trait RawConnectorState: AsRawConnectorState {
+    fn connector(&self) -> &Self::Connector {
+        // SAFETY: This is guaranteed safe by type invariance, and we're guaranteed by DRM that
+        // `self.state.connector` points to a valid instance of a `Connector<T>`
+        unsafe { Self::Connector::from_raw((*self.as_raw()).connector) }
+    }
+}
+impl<T: AsRawConnectorState> RawConnectorState for T {}
+
 /// The main interface for a [`struct drm_connector_state`].
 ///
 /// This type is the main interface for dealing with the atomic state of DRM connectors. In
-- 
2.46.1

