Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DD31AABC
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762135; cv=none; b=UEjRaWe3YrqUyucGZt1I6C/8scF5RmAQTogW8IzrD3mn8RZvfVwCm9OyunM0rONvw5+DylE22BwkWa7kxW7Ak9RpwR7tPMyfTKkbFquKw0NoIsFTuG3Jvd0I9SuoqGq11Y9eiD6+XkHhWYk0nJiaXdP4sV8GnL0klB3/ay3aARk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762135; c=relaxed/simple;
	bh=ipw5bgoYIbdMHnAzznY2C5vr+bcd52AqtLfBov3dFL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ul2Rzw+xaJU3nWRMr4oINF5jCS5pXAIetZIiZEpLIynmLygA069uTiDXa4P5mk7DUxDjjcyswNvB86dXfe+5KTAgVVnNs80pVDXba9PqfsmyYidTqAwKMJfRsviTTlPhlMedc70ForasF9+gta7iRfeiemXuUnLTLMs6RV+fYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=KpB6M1T7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="KpB6M1T7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1149275e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762127; x=1788366927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGf5rLY+VM/V7tx/TKkCWPRYXUV8BgBEPyz9uNJF8bI=;
        b=KpB6M1T7nzFlRTcFF526nDT4UrQO4Zle+FoHu7hR4bJvxvR6KWRxpJjLVOah7x7p/4
         BplVxEyfyGVRykZ3k5SZX/T5Cpoq0QoTijxvdbBWB8O/rnhZurIyhWFvTzBVB6C5AXcf
         gnZQuKKZB1kF7p2ZZ3IWmKZ4yRnBkhwxiaQPskUqVcmAMsDBm7NW5jlwnBn7xKaEspLg
         NObFg0duJFm7YdVBOWgWDbGccqb7g6aia2Topg8PiVYt6YuNK3MjXFeuTZ//D9N+rBLr
         oOjWkA0RtyjDfxddNcfG0JpBMVuPSChR5UCQvvJ2GaxgnRo3pgXbAOLfSZPhHY6ahHHQ
         ufXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762127; x=1788366927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGf5rLY+VM/V7tx/TKkCWPRYXUV8BgBEPyz9uNJF8bI=;
        b=HlLqXOpVWlrb53R42kgW6qbqwFB/WvDJGV+WD8esfZkcUuBlLsjWcEIsBgMpxu8Xl8
         UmbcgeXp4SfuZjyvzjLTvLb43Zdh7bwHI0YKgwEbrQhK7h83S9VtcBnrKT4dTX5A6YbB
         t9p/SfeDi+gExYUAbIzMZSIJsssfD2qDyanm/fo/1UoFu7NnOmZhPP6FJXujCf6GhVpe
         gAe08WbpwZo8BOPE6yoTJftiVGmI4IiuUccD1LzNnrZ+1ICcxmmvSMuNV+PaAHIXb6i1
         hluyqPxgnjvx7OGX8xvewZIHm/lz1idpAjmLNP8MEiglFAVbJUrqhyvLKXFJ7mHkeqvR
         +SEA==
X-Forwarded-Encrypted: i=1; AHgh+RrNuS4J1lbXpxc3+dHNli7uIoZKbB+h+44DYdA+lPBMcajAqU6Iub1sluqvVuIufSMH5GbJXj8LxS26UUigmw==@vger.kernel.org
X-Gm-Message-State: AFuF++mGuAOx42lnfgPdKqMZ39cia9mmp9+8dh3t18fpZKGsH03awg19
	UpQMad8DtuQig+m6xkbnwv4V5ZzdCqRPBKylfjUdvrFbxzDsdtquPJV7cJV2iBsOGg==
X-Gm-Gg: AR+sD12HP8+ZosA5P4Q68MZ3bj3rLuvRJryYjZXUESnOzcu8vfD88QqYvtzHlbmuBtI
	R5dj7gOWDJgEEATcbyhdl4vNC+5u2XwWr1Lg4G9eaDhBDheHU9DkRvrbHaaxZGvCuC3qbr7tcUi
	y8Q0i3NglZIpz5L8YwDgEiFl/AZ27dRK/FDWknrXXYlJ5i7WT9LL1x68Crq+joS93X1RXfFiqA5
	vdcSla3NKtWWDtAU/UJfuSy3KfYhZW7ynMK/MpeeriK0bJJkY5sCqiImSnNCE44nw/LXwEuyupr
	8PP09dn1yiJb2DzKSfFrs0rBP3f8/QXqshM1mha0j285/vMuKj9prLEmReqYOb14cKhG4alwQ+Z
	4W3S3W9l7SZLqf/0mVprnyxZwsJg4ArRWzHNQ2aExg3+5MtiZJremsGzLKT31HQ6wLYgcksCN5U
	DLFXzijCsj/l1qKP5hDgtUuqjMh9jb/i6x7Q6w/8NhrwOtqa+mx2c7l07Sjj1eenABX/0xFZtBo
	1JDIrqXQsLCDf3+BQ6iNJN02mU3fOgoBP+u
X-Received: by 2002:a05:600c:a086:b0:499:b000:b828 with SMTP id 5b1f17b1804b1-499dc6e9a9dmr93015675e9.4.1787762126720;
        Wed, 26 Aug 2026 09:35:26 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:25 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/23] rust: drm: kms: add connector detect() and mode_valid() hooks
Date: Wed, 26 Aug 2026 17:31:39 +0100
Message-ID: <20260826163359.4998-9-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add optional connector detect() and mode_valid() callbacks to the
safe KMS API.

Map connector status and common mode-validation results through typed
enums. Connectors which do not implement the callbacks retain the
DRM defaults of connected and mode-valid.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/connector.rs | 141 ++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 793a7bb5bfef..dd126469788f 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -5,7 +5,8 @@
 //! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_connector.h)
 
 use super::{
-    atomic::*, encoder::*, KmsDriver, ModeConfigGuard, ModeObject, ModeObjectVtable, Sealed,
+    atomic::*, encoder::*, modes::DisplayMode, KmsDriver, ModeConfigGuard, ModeObject,
+    ModeObjectVtable, Sealed,
 };
 use crate::{
     alloc::KBox,
@@ -72,6 +73,43 @@ pub enum Type {
     USB         as Usb
 }
 
+/// The connection status of a [`Connector`], as returned by [`DriverConnector::detect`].
+///
+/// This is identical to [`enum drm_connector_status`].
+///
+/// [`enum drm_connector_status`]: srctree/include/drm/drm_connector.h
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+#[repr(u32)]
+pub enum Status {
+    /// The connector is connected to a display and a mode list can be retrieved.
+    Connected = bindings::drm_connector_status_connector_status_connected,
+    /// The connector has no display attached.
+    Disconnected = bindings::drm_connector_status_connector_status_disconnected,
+    /// The connection state could not be determined (treated as connected for probing).
+    Unknown = bindings::drm_connector_status_connector_status_unknown,
+}
+
+/// The result of validating a display mode against a [`Connector`], as returned by
+/// [`DriverConnector::mode_valid`].
+///
+/// This mirrors a small, commonly-used subset of [`enum drm_mode_status`]; use [`ModeStatus::Bad`]
+/// for a generic rejection, or the clock-specific variants when a mode is out of the driver's
+/// pixel-clock range.
+///
+/// [`enum drm_mode_status`]: srctree/include/drm/drm_modes.h
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+#[repr(i32)]
+pub enum ModeStatus {
+    /// The mode is usable.
+    Ok = bindings::drm_mode_status_MODE_OK,
+    /// The mode is rejected for an unspecified reason.
+    Bad = bindings::drm_mode_status_MODE_BAD,
+    /// The mode's pixel clock is above what the driver can drive.
+    ClockHigh = bindings::drm_mode_status_MODE_CLOCK_HIGH,
+    /// The mode's pixel clock is below what the driver can drive.
+    ClockLow = bindings::drm_mode_status_MODE_CLOCK_LOW,
+}
+
 /// The main trait for implementing the [`struct drm_connector`] API for [`Connector`].
 ///
 /// Any KMS driver should have at least one implementation of this type, which allows them to create
@@ -106,7 +144,11 @@ pub trait DriverConnector: Send + Sync + Sized {
             atomic_destroy_state: Some(atomic_destroy_state_callback::<Self::State>),
             destroy: Some(connector_destroy_callback::<Self>),
             force: None,
-            detect: None,
+            detect: if Self::HAS_DETECT {
+                Some(detect_callback::<Self>)
+            } else {
+                None
+            },
             fill_modes: Some(bindings::drm_helper_probe_single_connector_modes),
             debugfs_init: None,
             oob_hotplug_event: None,
@@ -114,7 +156,11 @@ pub trait DriverConnector: Send + Sync + Sized {
             color_format: None,
         },
         helper_funcs: bindings::drm_connector_helper_funcs {
-            mode_valid: None,
+            mode_valid: if Self::HAS_MODE_VALID {
+                Some(mode_valid_callback::<Self>)
+            } else {
+                None
+            },
             atomic_check: None,
             get_modes: Some(get_modes_callback::<Self>),
             detect_ctx: None,
@@ -153,6 +199,31 @@ fn get_modes<'a>(
         connector: ConnectorGuard<'a, Self>,
         guard: &ModeConfigGuard<'a, Self::Driver>,
     ) -> i32;
+
+    /// The optional [`drm_connector_funcs.detect`] hook for this connector.
+    ///
+    /// Drivers may implement this to report whether a display is currently attached. If not
+    /// implemented, the connector is always considered connected (DRM's default with no `detect`
+    /// hook). `force` is set when userspace explicitly requested a forced probe.
+    ///
+    /// [`drm_connector_funcs.detect`]: srctree/include/drm/drm_connector.h
+    fn detect(_connector: &Connector<Self>, _force: bool) -> Status {
+        build_error::build_error("This should not be reachable")
+    }
+
+    /// The optional [`drm_connector_helper_funcs.mode_valid`] hook for this connector.
+    ///
+    /// Drivers may implement this to reject modes they cannot drive (for example, a mode whose
+    /// pixel clock exceeds the hardware's budget). Returning anything other than [`ModeStatus::Ok`]
+    /// prunes the mode from the probed list. If not implemented, every mode is accepted.
+    ///
+    /// [`drm_connector_helper_funcs.mode_valid`]: srctree/include/drm/drm_modeset_helper_vtables.h
+    fn mode_valid(
+        _connector: ConnectorModeValidation<'_, Self>,
+        _mode: &DisplayMode,
+    ) -> ModeStatus {
+        build_error::build_error("This should not be reachable")
+    }
 }
 
 /// The generated C vtable for a [`DriverConnector`].
@@ -477,6 +548,32 @@ impl<T: AsRawConnector> RawConnector for T {}
     T::get_modes(connector.guard(&guard), &guard)
 }
 
+unsafe extern "C" fn detect_callback<T: DriverConnector>(
+    connector: *mut bindings::drm_connector,
+    force: bool,
+) -> bindings::drm_connector_status {
+    // SAFETY: This is safe via `DriverConnector`s type invariants.
+    let connector = unsafe { Connector::<T>::from_raw(connector) };
+
+    T::detect(connector, force) as bindings::drm_connector_status
+}
+
+unsafe extern "C" fn mode_valid_callback<T: DriverConnector>(
+    connector: *mut bindings::drm_connector,
+    mode: *const bindings::drm_display_mode,
+) -> bindings::drm_mode_status {
+    // SAFETY: This is safe via `DriverConnector`s type invariants.
+    let connector = unsafe { Connector::<T>::from_raw(connector) };
+
+    // SAFETY: DRM guarantees `mode` points to a valid `drm_display_mode` for the duration of this
+    // callback, and only passes us shared access to it.
+    let mode = unsafe { DisplayMode::as_ref(mode) };
+
+    // DRM invokes the connector helper while the mode list is stable. Keep that guarantee in a
+    // capability type so drivers can safely compare this mode with the other probed modes.
+    T::mode_valid(ConnectorModeValidation(connector), mode) as bindings::drm_mode_status
+}
+
 /// A [`struct drm_connector`] without a known [`DriverConnector`] implementation.
 ///
 /// This is mainly for situations where our bindings can't infer the [`DriverConnector`]
@@ -572,6 +669,44 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+/// A connector being validated while its mode list is stable.
+///
+/// This is only constructed by the DRM connector-helper callback. It permits read-only iteration
+/// over the connector's modes without exposing list pointers or extending a mode reference beyond
+/// the callback.
+#[derive(Copy, Clone)]
+pub struct ConnectorModeValidation<'a, T: DriverConnector>(&'a Connector<T>);
+
+impl<T: DriverConnector> Deref for ConnectorModeValidation<'_, T> {
+    type Target = Connector<T>;
+
+    fn deref(&self) -> &Self::Target {
+        self.0
+    }
+}
+
+impl<T: DriverConnector> ConnectorModeValidation<'_, T> {
+    /// Return whether any mode currently on this connector satisfies `predicate`.
+    pub fn any_mode(&self, mut predicate: impl FnMut(&DisplayMode) -> bool) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: DRM only constructs this capability while `connector->modes` is stable. Each
+        // list entry is an initialized `drm_display_mode`, and the shared reference is confined to
+        // this callback invocation.
+        unsafe {
+            let head: *mut bindings::list_head = &raw mut (*raw).modes;
+            let mut node = (*head).next;
+            while node != head {
+                let mode = crate::container_of!(node, bindings::drm_display_mode, head);
+                if predicate(DisplayMode::as_ref(mode)) {
+                    return true;
+                }
+                node = (*node).next;
+            }
+        }
+        false
+    }
+}
+
 impl<'a, T: DriverConnector> ConnectorGuard<'a, T> {
     /// Add modes for a [`ConnectorGuard`] without an EDID.
     ///
