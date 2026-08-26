Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B33346D541
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762154; cv=none; b=ctcR/x4i5myi4DgEpYeTTalUrVambJLf1oD2FzJma4sTd0Keuru5JUhf/KFpUHymgJ3t20GxfczGu29nudamLFma4PEOzWkK7mKIeVS9SxKB/ZHx6wOTCtBcrAz+FrZqSl3SvQHTuRJm55d7Aw5bGLw7h4z4o9azDx7oNahO5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762154; c=relaxed/simple;
	bh=OVIPP94ZLD/y5HONx5GsCRP6mP9WCiWDuBJr3UIPXIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSk3izVEYrclUtBTYqchCJuYivvj5dHeJHlc3Wt4dvaOGPijyT1arbj/5MrbZX4xRIKhIwFMA4+zGMlHEU+91uXaAbehMkXpZRmwo0Zmldp2Vdfj2wwbXyQY064r5GOVwzA9owoaL9WjNQDsNYQtKWPGCvdbTdrZYioUTMHHU0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=AtLXygVL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="AtLXygVL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso9948695e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762145; x=1788366945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2OUdL17iweLbkwDhh4IsnYuPIiYki9paBB+a21GlgG8=;
        b=AtLXygVLGPdhr1+oyJQZfBkm4TSMle0gnZXuras/TtO1YCldVgg1tEXHxQXbovROtR
         Yd9VZESJ4QzRAdBxkZhawZ0emO1vAeZIo22EopwzC00+9u0KwnITz4eai30AcKwK/Z8i
         mR2ekfQiNMvwLiA6Q70euUw5ZJaJnr0KKBZe9mkzRMpnbaF/mQkDW8nl7fPudt433V2S
         PCAdVgCNK5nScOD5MvyMwKH26L4KuYY5g3JEc1+bTIHB2iMe95NvnuOnDHetqWGYkWCQ
         11m0eS27PStXAhoXOC8W0Iue/zCfLwQ067NNIXkvJS+iRZc8x7IczKnwIaw9NIl4za0G
         5k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762145; x=1788366945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2OUdL17iweLbkwDhh4IsnYuPIiYki9paBB+a21GlgG8=;
        b=Uw/37c/9E3lS/hgIuuhVPBaXabP7tYzArfQ7kWjEpfiFvB5B5wDZ1Oi1nhsx83csEx
         XvSYWzJ3Iwbl9GZ6ZHeXpDVXDIXwQO1ExSu8QUnK65RukiLkRIQqktIGQzDb7Uj6obMa
         N0a9nxvURwiim93N4PmemnrKLArTs0Bl+wprot74K6NmfzB/DQagAM6RsQTkOhYnXx+K
         UI8aFkFmo/ffYfqAM9NrDsuO++pZ1GuAtzokXrkcvdIGz5tNxF3OfL761P0aPvTyWH5X
         hcgAdgSOLgoWSM7Z/Qydoy3e3y0WLZRruQq1Eel7G1vY6qFy3+yxyivPIBmTiwVBJL23
         NvBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqT9QHNxzX1W/uOPfPP/ic+9m4NBkctQgg//O4quUvK/HpDe+lfhrxDvFaTXAhTyCNx4RzIDtNtwym1NhmWlA==@vger.kernel.org
X-Gm-Message-State: AFuF++kckHbxxLBmHVP/ZlbQjhWrlCwuDx1zusf2GqaLLQ1sHSb6y7cM
	Mnsl+f9qYG3vL7Fw3Z0ljteO63LGwBNqz1dYwwy1k+uOVsbzoH17k5x2vt5HnYuGOA==
X-Gm-Gg: AR+sD13r+NZ60NGBLjAwePYr7tLIld8+r3juvt4LwfICCCQ2GYqIhsflzZxj7BAiTBL
	rR2TOnx1Tkn2zO0vJMCZo7zsimSu9cxOJikgqChaPhjP/cvX37z6ZlQbJ0NjlD27FAd3OY0Zc1N
	Pyes+y/I0bckzl6/aQKSwWIrXXc06uiUcp/c+WmE/WQpZzrle8wHmrRYednmLSoMHw/MIlcJx9v
	VFhwTup7/q2U0mbczYwqzBOL4/+5z5ZLKFFpaCLhFSZtUyBbs56nR8O+Rf5fhpqNxA1Dy9QIMWv
	XFr1hIob+/SZhYlG/2y4Y+h5WbQqgqgVk08UT2t7pf2FffUOxtR2vLalQ9bP+3mWDByCxP9FpUp
	Zh53rF1hGlHsbsUDoLX1vVggVIVy2VXyGTkYAf6ECAZkljX4goYBw5X65UTOvFN2y9OppFNsyJd
	R7NYo0VBldQ97NNSRKnyQofz1LJ6KfddYzBG6GzAugTXIWweVWzU1NZGWaPuCYXOWairhAgo2JZ
	ySLW8y+aZUSox4D6d/zFo5cwhc9X/uPlSlCAyrTQQ86pG5C
X-Received: by 2002:a05:600c:3f0e:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-499dc825cfamr95483725e9.14.1787762145530;
        Wed, 26 Aug 2026 09:35:45 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:44 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
Subject: [PATCH v3 11/23] rust: drm: kms: expose checked plane geometry
Date: Wed, 26 Aug 2026 17:31:42 +0100
Message-ID: <20260826163359.4998-12-mike@fireburn.co.uk>
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

Expose the requested source rectangle and the visibility and clipped
rectangles produced by drm_atomic_helper_check_plane_state().

Keep 16.16 source coordinates explicit at the raw-state
boundary. Convert helper-clipped source coordinates to integer pixels
only after rejecting negative or fractional values, and return the
clipped destination in CRTC coordinates.

These generic accessors let Rust KMS drivers implement cursor
clipping and validate full-frame scanout without reaching into
generated bindings.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/plane.rs | 59 ++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 3bff4091abb2..bc830503b142 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -758,6 +758,65 @@ fn crtc_h(&self) -> u32 {
         self.as_raw().crtc_h
     }
 
+    /// Return the requested source X coordinate in 16.16 fixed-point pixels.
+    fn source_x_16_16(&self) -> u32 {
+        self.as_raw().src_x
+    }
+
+    /// Return the requested source Y coordinate in 16.16 fixed-point pixels.
+    fn source_y_16_16(&self) -> u32 {
+        self.as_raw().src_y
+    }
+
+    /// Return the requested source width in 16.16 fixed-point pixels.
+    fn source_width_16_16(&self) -> u32 {
+        self.as_raw().src_w
+    }
+
+    /// Return the requested source height in 16.16 fixed-point pixels.
+    fn source_height_16_16(&self) -> u32 {
+        self.as_raw().src_h
+    }
+
+    /// Return whether [`Self::atomic_helper_check`] found any visible part of the plane.
+    fn visible(&self) -> bool {
+        self.as_raw().visible
+    }
+
+    /// Return the helper-clipped source rectangle in integer framebuffer pixels.
+    ///
+    /// This is valid after [`Self::atomic_helper_check`]. Fractional source coordinates are
+    /// rejected with [`EINVAL`].
+    fn visible_source(&self) -> Result<Option<Rect>> {
+        if !self.visible() {
+            return Ok(None);
+        }
+
+        let src = &self.as_raw().src;
+        if src.x1 < 0
+            || src.y1 < 0
+            || src.x2 < 0
+            || src.y2 < 0
+            || (src.x1 | src.y1 | src.x2 | src.y2) & 0xffff != 0
+        {
+            return Err(EINVAL);
+        }
+
+        Ok(Some(Rect {
+            x1: src.x1 >> 16,
+            y1: src.y1 >> 16,
+            x2: src.x2 >> 16,
+            y2: src.y2 >> 16,
+        }))
+    }
+
+    /// Return the helper-clipped destination rectangle in CRTC pixels.
+    ///
+    /// This is valid after [`Self::atomic_helper_check`].
+    fn visible_destination(&self) -> Option<Rect> {
+        self.visible().then(|| Rect::from_raw(&self.as_raw().dst))
+    }
+
     /// The plane's rotation/reflection (`DRM_MODE_ROTATE_*` | `DRM_MODE_REFLECT_*` bitmask), for a
     /// plane with a rotation property (see
     /// [`UnregisteredPlane::create_rotation_property`]). Defaults to `DRM_MODE_ROTATE_0`.
