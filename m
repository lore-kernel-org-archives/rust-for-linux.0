Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFAF470EA1
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762262; cv=none; b=ZxfMGSAfh1H8DXFfVwC+/w9ZIHborzXmZg/4kj6tYp9vxcF9305R7bN+d3lvm/Pj2/TIOQXnmYsHp1YWBnNSpnWlxc/1ptrpB5PKhJffUK4kLzfElC+2/OOeyAeunPjQmGvlWjFm61wCTZQyxfdc8eXMmtj/E5vpuZhLHhdy/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762262; c=relaxed/simple;
	bh=fysDNVWUuO78nym/TFKdoO0ItGD8Mdurf1UqAICYgn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7kVllQrCf1YfJfWEjGTKVPnOZuIhfpMhebZnjK/B4gjdEzJnyy+ZJMZ60aAs7Sc89vBVL2wEATiSLsnT9I27T7ZutkanomACbXrLLXfzY7FTvjz01lzC1RE0bwTw3/hKZrVvhdDTu4Fp7S7NmtvPhDYqMAAVcu+zn3Z3YxEnhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=d256dyr9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="d256dyr9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so596400f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762217; x=1788367017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkRk1iaOzdwQPEjbMkHe3YM7CcoWsAQlRLu4eqxZlx0=;
        b=d256dyr9s2t6PUXqmjmZprPriAj/byicXLyJ5B+9J9BEx1cG/OpCCnvH5284Jh7Fvk
         ytW4UYFtX50pL2jppAquccIDRu/b0VUBFu7iuvOPTAK5wQaaVBt0IAIsy/KxSgR8fYCC
         ABhncw9alrbW7Zr2AcI217a0Cvm+eeJD+pl2JwwwiCDJmZTSqpAQbrVOzIqKNxwoj3NB
         pKQHeUD63Mntspss2LWSvKT1dINvGuorKVfEH0ewvlx6pa3XreH+ke8ous9Ookc0s0au
         bvVzzlrpxHH5Cd6xL+hF+sM8X7CrCJ7cB1b4avTrMoym8+fVdTb1SMmWglOO1YXZtvyv
         WQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762217; x=1788367017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkRk1iaOzdwQPEjbMkHe3YM7CcoWsAQlRLu4eqxZlx0=;
        b=jjWCYKjTVeTyHgDPUOACrMlgoSLJz3HguXulomXCJrnlD3abZUu755hhP3qEJ3ghpM
         tIrTehQQv1BpA9MGD2FHu8JA3VzhQxrdJVH5i/X+54vjRBE68Q2jJDCHvgp9yDj7A2mG
         +DKmkFwUS/LtL86KxCdQZCC9dkv0Ksfg1IZv3/w+4VZIybAV0ABRTPo7Lw4If6G3YGTN
         51or3gTVavOReX9+S1ra5NCnaARWf0D6adu0nJABd7JRcGtiIULQpCgkeQIgM9oWWq6f
         S56lT6Skt3FOUwFQYXAV3zcf2udxqqdwL4NRtoV0vILIzywK+eKGmkOd0vIL2xj3DFmr
         O4GA==
X-Forwarded-Encrypted: i=1; AHgh+RpEHjcrqh+yYQbo07Tqd3yXKodYJVlPFKw7xH9GTemsXtyd9zzDIREnodgFcIPBw/QfffJ3g5xHT5OusxI4Rw==@vger.kernel.org
X-Gm-Message-State: AFuF++kyBtTBS7+801bcbJoEJu1DhT1iQAffHYylZEuip40rc7Ip0lM2
	ZBQ8FBh3UY3ZL+j1HS4iusu96JyZgZOwrpMoamk2+vnObpxQPVi3645CU2q87y8NVg==
X-Gm-Gg: AR+sD10yqs3L8wALkd2wc3VFx3dLbiCtRlLoMEk6w70Ua3NmIn17Kczjd401Z+QlYaD
	mTNyaaO1MJyaE1/gYQei8mYLz84ZY+2eb2nUuN/6g3ThdIV/nG7ahXWaov3a4I5QI9d9AUTDx6m
	uUme3gtMwndMijeR9Iu+cgSrKhm/uDtdpePRu8StH4sCnfQ7OvQldv0Bv1qbAwgJL6CkqSOBrPI
	Y2/qE8sqRRvk0ln0r3HKf2cEdb/nAbXg6qpGB3TDJYq+ddh3VbJw3eqki/9ZYfu86XET2tnNCMb
	bp18O1tQaNV/4I1/h9loWE11G+t3wZzBBXLfOoZ2YjN/cVimRC/JdL+0DqvaMBzM+Ko5ZBYOKfW
	MyrDnr8IwdtPLNE2ZgZR+UIYOEEqyOmhOlllBxXkqPxIWe2tG2rZBWogcyChVvhSSMdK7cVraaa
	w1hZhsQa2UqTQQyk8n4MO73Dm5TBgOijN96BLO0aBD2WBSfdKVwsdo0OalLYq/+ZtFdM5M3Uz3K
	R8jj1Jr+AJLMfGYCnVXU76z3Y0SNdsRQKV43QLoQU35wh0=
X-Received: by 2002:a05:600c:811a:b0:499:db9b:f253 with SMTP id 5b1f17b1804b1-499dc6ec214mr84001985e9.3.1787762217462;
        Wed, 26 Aug 2026 09:36:57 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:55 -0700 (PDT)
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
Subject: [PATCH v3 22/23] rust: drm: kms: walk the CRTCs an atomic commit carries
Date: Wed, 26 Aug 2026 17:31:53 +0100
Message-ID: <20260826163359.4998-23-mike@fireburn.co.uk>
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

A driver enforcing a constraint its CRTCs share -- a bandwidth budget,
a clock source, a fixed pool of scanout engines -- has to weigh what
every head will be once the commit lands, and a per-CRTC callback can
only reach its own new state. Reaching the others through committed
state answers a different question: it prices each sibling at what it
is leaving rather than what it is taking, so two heads that both rise
in one commit each find the other still low, pass individually, and
break the shared limit together.

Add the walk over the CRTCs an atomic state carries, the Rust spelling
of for_each_new_crtc_in_state(), on both the state and its mutator.
The CRTC is handed over alongside its new state because the
driver-private data that names what a CRTC drives hangs off the CRTC,
not off the state.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/atomic.rs | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
index f9f91edc89c3..24daeaeca075 100644
--- a/rust/kernel/drm/kms/atomic.rs
+++ b/rust/kernel/drm/kms/atomic.rs
@@ -142,6 +142,48 @@ pub fn new_connector_state_for_crtc<C>(&self, crtc: &C) -> Option<&OpaqueConnect
         None
     }
 
+    /// Invoke `f` for every CRTC this [`AtomicState`] carries a new state for, passing the CRTC
+    /// and that state.
+    ///
+    /// This is the Rust spelling of walking `for_each_new_crtc_in_state()`.
+    ///
+    /// A driver enforcing a constraint its heads share -- a bandwidth budget, a clock source, a
+    /// fixed pool of scanout engines -- has to weigh what every head will be once the commit
+    /// lands. A per-CRTC callback that consults committed state instead sees each sibling at its
+    /// old value, so two heads that both rise in one commit each find the other still low, pass
+    /// individually, and break the shared limit together.
+    pub fn for_each_new_crtc_state<F>(&self, mut f: F)
+    where
+        F: FnMut(&Crtc<T::Crtc>, &OpaqueCrtcState<T>),
+    {
+        // SAFETY: `state` is initialized via our type invariants, and `crtcs` together with the
+        // device's `num_crtc` are invariant for as long as we hold a reference to it.
+        let (crtcs, num) = unsafe {
+            let raw = self.as_raw();
+            ((*raw).crtcs, (*(*raw).dev).mode_config.num_crtc)
+        };
+        if crtcs.is_null() || num <= 0 {
+            return;
+        }
+        for i in 0..num as usize {
+            // SAFETY: `crtcs` points to `num_crtc` initialized entries.
+            let (ptr, new_state) = unsafe { ((*crtcs.add(i)).ptr, (*crtcs.add(i)).new_state) };
+            if ptr.is_null() || new_state.is_null() {
+                continue;
+            }
+            // SAFETY: every CRTC of a `KmsDriver` device is a `Crtc<T::Crtc>`, and a non-null
+            // `new_state` is a valid `drm_crtc_state`. Both borrow from `self`, so neither can
+            // outlive the atomic state owning them.
+            let (crtc, state) = unsafe {
+                (
+                    Crtc::<T::Crtc>::from_raw(ptr),
+                    OpaqueCrtcState::<T>::from_raw(new_state),
+                )
+            };
+            f(crtc, state);
+        }
+    }
+
     /// Return the old state of the first connector routed to `crtc` in this [`AtomicState`], if
     /// any.
     ///
@@ -282,6 +324,16 @@ pub fn new_connector_state_for_crtc<C>(&self, crtc: &C) -> Option<&OpaqueConnect
         self.state.new_connector_state_for_crtc(crtc)
     }
 
+    /// Invoke `f` for every CRTC this state carries a new state for.
+    ///
+    /// See [`AtomicState::for_each_new_crtc_state`].
+    pub fn for_each_new_crtc_state<F>(&self, f: F)
+    where
+        F: FnMut(&Crtc<T::Crtc>, &OpaqueCrtcState<T>),
+    {
+        self.state.for_each_new_crtc_state(f)
+    }
+
     /// Return the old state of the first connector routed to `crtc`, if any.
     ///
     /// See [`AtomicState::old_connector_state_for_crtc`].
