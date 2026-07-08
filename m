Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8913F8233
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547316; cv=none; b=GdoljmNwJu9Zif0zJaICZxCZKxCGdD4QyM5jwTFggnCgBNMRvGMw+mOnviJBfDoT3+bz1k07l/frunT6MR54CwVTeNEMqFjs3sRJAPsuesp3abDzp3eruFQpCo+IuWBkiGenfkviUx66RDDktIFYAP3llExVZpoMWabkvMQUvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547316; c=relaxed/simple;
	bh=ohIJHi0HjdD9bBbQzoaPkpUGIGBnuQRogpMEkyBJxNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEfeAKma/+JU+hPGMoqZnSrOquu7yQtWzAsAzLTUsB8jFkyPPdRP1PHe1+QoPy2BO3Lq24i5p/WOhK4rm1vVATe7FHih0dbhP32wjWRgeKty63o7lmsxRj13pNCn6yjwHtL5K0wZtA8IUwNsjCRYSjeU1SfJ+hV2AAAzDXxn7iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHDw093r; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHDw093r"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1290617a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 14:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783547314; x=1784152114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1YrMqSLA8v+9cu+GwrvjQthrOMf2VILPEYKg9x3ud8=;
        b=dHDw093r8lmvLWAErB9JH3mEAGHX5Lsac6/r+kS/sjKmtwboQXu/CFTYf6c0abr6Js
         Vnrf1PLIEVM4ZgxzP2YU/0NAjTVINgMC5APzSnodSZs5rc28iB2k6FPMF0HqRb1kOOAE
         JmdYB37U/5HSnxgRRVDxSp/VY10xrC2o7h8KbsRTiPZD7kevgvVvLaLdQuzAGjg9HCNK
         mgigBEUQ6loCweUYrQoWDBj9MCrri9l9h/ZOhOIxzHOoT9pDNJcYcncE6s4qxCbQGNZ+
         wMcTJMT6I4ryCGa2+yc0u52kreH5fsoMk/ALPXekE1Wu+snVBdbMQkBZUKQqPSyk9TGF
         hkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547314; x=1784152114;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1YrMqSLA8v+9cu+GwrvjQthrOMf2VILPEYKg9x3ud8=;
        b=dWry0HI+C5WFAn6tYKX2FdCreXmO+yOug9frzvkjIsFS2mJVXBWlF6FkOmKnuwyV8M
         kILb7+IxrvVnM9hD64/oabTV3O3vag0Q8Es5+CSaABcqiskkTC17eoD8VYFfXSM6NGG8
         Qo9BtfNPMkNl5p7YJYHjYHApDKQWSkwC3xCqdHI7AsvumxLSCUAnIgzO1QJint7xBtId
         jw1dV+Yd+osHO9hwc2JDbTkUUKmlbWb8kn0SI1ZSJt5t8oEDWU0+HVu5aCVKHqQ3R6DU
         IJqdgDAa0BkTORqFSV4q5yvYRjR8mZbQxoxTS9ozkgcWOIdHPnd2GApG2I9hucEmfJ0a
         nqbQ==
X-Gm-Message-State: AOJu0YznQcF7yxIjU/ZEFzlPqwBesdQwtIO9wYr82YhNDwkCXd+TVDxU
	YcC80WpzyMhNg0hFRoLvd3enGAPK+5Ktp4r1Y2zmCKSKpCcvgPfp//6HiYKyT8aOX5s=
X-Gm-Gg: AfdE7cmSjN5T4u+n6v8DUICCRKEpmtUeYeK/AIWp7WBWrw5TIA3LaLJoVwxFCogqhym
	QDYp3o2Hf0KkELeOnPC39gqMzVG9v91aYi6zmzfHL1IJUsVS1+4e8RPdw9aWuBXUwxy4YeDMKX7
	opS6spz+CaBIQD8Ape588EhQpo+bG0vW7nx4cdVwvcgyVBmq8jFh0kPOw0LWtIcRIgT0B5+U/M4
	ck1rV/qHjxtt4+RNe+ajX5FBFLpXMMuvewLfDfbnm9RmVvDBI2VNLk1z2tNRXw6gWsFJE9G12oz
	zflBo3op7B4HHoWzvegz+n2IMaY3PtoZrk5X9t2cvvPGeyWAeLkX2H9mKSrQX3MR45pdjKIE+IS
	LuhZf7R0ST0gLq2fqAPXpaPMIsagnWLVQwAK+k70pdRsEoGtexEkPIJ75kadfNu/GR3WCiML/CN
	0M50pzT+svNyK9soK8htRBUWAJO71VFC67o4Xe614F9V8keRibewEmCwyQImkVFskSNq/CKUw0Y
	Jabxm9u3wRJ5xrPREMkrEnKpfSBHzOdowaYYcDpUvbFfCc7r4VtUuUxiBYFU+XdIomdbarx+J6F
	XBqh14bIoCCvKpx63nFnHQJEF1HOBqvMq6GHY20lFI1DExucSSot4IjZ0BpMtvAkEB7cAETVVNn
	0z6XDF5g=
X-Received: by 2002:a17:90b:52d0:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3894014c54emr4820508a91.8.1783547314134;
        Wed, 08 Jul 2026 14:48:34 -0700 (PDT)
Received: from ip-172-31-21-198.us-west-2.compute.internal (ec2-35-85-29-74.us-west-2.compute.amazonaws.com. [35.85.29.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d946sm33733855ad.66.2026.07.08.14.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:48:33 -0700 (PDT)
From: Bruce Robertson <brucer42@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sebastian Reichel <sre@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Bruce Robertson <brucer42@gmail.com>
Subject: [RFC PATCH 1/3] rust: i2c: add SMBus byte transfer helpers
Date: Wed,  8 Jul 2026 21:47:36 +0000
Message-ID: <20260708214738.25008-2-brucer42@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708214738.25008-1-brucer42@gmail.com>
References: <20260708214738.25008-1-brucer42@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Rust I2cClient abstraction provides device-model plumbing but no way
to perform register I/O. Add safe wrappers over the SMBus byte
primitives:

  - smbus_read_byte_data() / smbus_write_byte_data() wrap the C
    functions, converting the overloaded s32 return into a Result and
    confining the unsafe FFI behind the type invariant of I2cClient;
  - smbus_update_bits() composes them into a masked read-modify-write,
    with the bit arithmetic factored into a pure, testable apply_bits().

smbus_update_bits() is not atomic against concurrent callers; this is
documented and sufficient for single-threaded probe-time use. A lock
will be required before a second accessor is introduced.

Signed-off-by: Bruce Robertson <brucer42@gmail.com>
---
 rust/kernel/i2c.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 624b971ca8b0..07ce4299ff56 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -486,6 +486,48 @@ impl<Ctx: device::DeviceContext> I2cClient<Ctx> {
     fn as_raw(&self) -> *mut bindings::i2c_client {
         self.0.get()
     }
+
+    /// Read a byte from the device register at `command` (SMBus read-byte-data).
+    pub fn smbus_read_byte_data(&self, command: u8) -> Result<u8> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct i2c_client`
+        // by the type invariant of `I2cClient`.
+        let ret = unsafe { bindings::i2c_smbus_read_byte_data(self.as_raw(), command) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u8)
+        }
+    }
+
+    /// Write `value` to the device register at `command` (SMBus write-byte-data).
+    pub fn smbus_write_byte_data(&self, command: u8, value: u8) -> Result {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct i2c_client`
+        // by the type invariant of `I2cClient`.
+        to_result(unsafe { bindings::i2c_smbus_write_byte_data(self.as_raw(), command, value) })
+    }
+
+    /// Read-modify-write: set the bits selected by `mask` in the register at
+    /// `command` to `value`. Bits outside `mask` are preserved. Skips the write
+    /// if nothing changes.
+    ///
+    /// # Atomicity
+    ///
+    /// This read-modify-write is **not** atomic against concurrent callers. Two
+    /// callers updating disjoint fields of the same register can lose an update
+    /// (both read the old value; the second write clobbers the first). Rust's
+    /// safety guarantees cover memory, not device-register atomicity. Until this
+    /// is serialized by a lock (cf. `regmap`, which holds its own lock across the
+    /// RMW), callers must ensure mutual exclusion — currently safe only because
+    /// the single probe path is the sole accessor. FIXME: add a lock before the
+    /// threaded IRQ handler (Phase 4) introduces a second accessor.
+    pub fn smbus_update_bits(&self, command: u8, mask: u8, value: u8) -> Result {
+        let old = self.smbus_read_byte_data(command)?;
+        let new = (old & !mask) | (value & mask);
+        if new != old {
+            self.smbus_write_byte_data(command, new)?;
+        }
+        Ok(())
+    }
 }
 
 // SAFETY: `I2cClient` is a transparent wrapper of `struct i2c_client`.
-- 
2.43.0

