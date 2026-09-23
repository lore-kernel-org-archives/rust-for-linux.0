Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176AC56B854
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201150; cv=none; b=h4pozHXXXKTwuEHF6t+c1aV7RcdYvW0XTSpgm85aT2qjBsU2ohPRc+pTM/4SFTmJpFzaO98nwuQgZtamA6AbcjoBSTdH2cQ276nfA4STXu4UrR1DB6i3Ni5zXuMz12L3bp9EOVMspfsd7cCCWaAwb/W1Hc3X9n4i7bgMwqYvqt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201150; c=relaxed/simple;
	bh=K2axbYRQNW+6vDySUPFdJODepbCos+4GY8IGWK9+sB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=raXs706In4uCqo8IZBnhq4YwLEE6URLXN9rKSvmE2c03aMwLwH+lnauoAr7DQjT0XRFuz3LmVknH6JCyn8o2Yc6O+OC+D6j8qu7f+0tyuGM5RA0/5UNi/I5ZqQdGzQrQE1PkrNqK9HCVeI7weAzOho+2ccDrWSawfYhtAL51pOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=PWohvULh; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="PWohvULh"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664d340aso914995eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 15:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1790201148; x=1790805948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/nnxvPu+Ie5/oYJqt1aHS/OFcFQN5Rkx07F17u0JBU=;
        b=PWohvULhtq2cuD9UNRoKn05JKrY7f5Q5fbpkJ047o9ms5IdsRkxyk4+fEPLuXYsxCF
         KMaZYptWRuPKMBz85zizxXHOSYsE6xVh71JartJd3a3CrYbPaWPN328nH7lzCBBkC07T
         OoeRAs3x+48ysJ8s5rNy46vvUWIlVfoc5NbwSyU/5VEweUocLkpXTIgzR9ZQIWPXdFu5
         n57ThrGOvJVgfaRi74aDNblWeRG0pCo98EsCh6SRZ2CcNZh7NxERflkthmIfF8/fAExQ
         nK7lSnv2NhMdTQcVzKvAoPzuHkRSw6rTBsK6lfAVEhfGCbDMGXSSYYLUK5EtnzPwV4y0
         s5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201148; x=1790805948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/nnxvPu+Ie5/oYJqt1aHS/OFcFQN5Rkx07F17u0JBU=;
        b=nENPwbTftuFB5uPpDfoQHjxaCAekVna0SF1jtVK0VZZQFBoEoFQES7mvr7eHGbKDKS
         pCj3LU0XGgNrOEDuqgYb1CUnjckGTG67C/utKjqnRxuj530n99xqE5G3JC555qkRePWW
         d49WYFU69PVziI+3YR+8aiGDuj2DphJXhk5ml65/EdMisOA89yqeNP0iL02l2l6kVFkT
         wC7lmwDeCLzpA4wwwOylFZRsfZuc+seVox1LKLs5nJZXJMse77dBmGdTaIAXbvg3gij/
         Mnpecx31gaZc+y4k4wGF2e0LBqAaW9M4ueA1+LXUGLJJ0uqOOuuMLkFKUxESAjGTm3tP
         RHFA==
X-Forwarded-Encrypted: i=1; AKwUvByM1yPoGtS3eHjIru6hzJomeBy1tLZGYjGwGEkaQu5iKlhVOOSBiFcYN/gakTp0L8CjqxIM7th8O8zxFHVrXQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lCzzqV10TwRW2ko4mV4BoZCbZ1F5DS5jnipUQAQV8ZULLwimZz
	1Wd2rJZFW+42wPrfDCGJFsHK4/6zFFikZsb7I6E4qjt7vLfAtdTXsrYQJC18cY/GExE=
X-Gm-Gg: AYBFou3PO0eXjtq4BAewgXdStcYRnUFs/xr2+LwUPu/iSvOyCmr0s1Q9JWINEuC0tmq
	DetfSwOP+rv3I2gYnZ/F/pUj3rkY/UnYEKuNoRj3YDy4mzxSiIokOVDGiJahV9zjBsVeutp/oau
	7U9HIEYyWPgd5MMSlzf7Pr0F+sePz1VzdJGmN4DRkOnJjAE0xqE6Z2qYYOsok7xpbw43ouxX17S
	Cx01y05V6BQ59EKfe0BJX261K9KMV69ju4oc+gjzjMaTnibSazZs5QL7REpJtyGLlDirRA57URx
	EPqF9XiFweVE5z9ApRzINZLMMV9GJ9XeIaDK0a2/TtWaN/TJO9ydbpZRWEWjeZR23l1E1LR5T8w
	H59R1pYIlMMk2uZUB2a2yRPrrCEdg4n3ewwl1+oNT7ng5ShTwSCtuRQeXoDA7ryKm85X3TbvJgf
	kJDOyfAHbB7VSPsFlRSm+FN0bH2L0MuzeMm1XXH5l5RXFherHP7G7NvPW4+Jp/+iLv14K5XP3jZ
	cPylb4QBvUwgPiYlpTFpmQ1Sp6C3NXhS4wnybl8zMpycQ==
X-Received: by 2002:a05:7301:7bc9:b0:33c:e91:271b with SMTP id 5a478bee46e88-34001220f83mr451635eec.36.1790201147964;
        Wed, 23 Sep 2026 15:05:47 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33e96946d0csm9038456eec.21.2026.09.23.15.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:05:47 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: configfs: Fix incorrect subsystem root check in `get_group_data`
Date: Wed, 23 Sep 2026 22:05:45 +0000
Message-Id: <809b66930e6b7a47535c87366b193695f420d2df.1789770689.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1789770689.git.pgovind2@uci.edu>
References: <cover.1789770689.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `get_group_data` to determine whether `this` is 
subsystem root, the following check is performed:
`(*this).cg_subsys.is_null()
`get_group_data` then tries to read the `data` field of either
`Group` or `Subsystem` structs depending on the result of the check.

But the check always evaluates to false in `get_group_data`, since
`link_group` in C always populates group->cg_subsys with a valid, 
non-null pointer.
Thus, if `this` points to a group representing the subsytem root,
the incorrect branch in `get_group_data` may be taken, 
leading to attempting to access `Subsystem.data` as `Group.data`.
This is type confusion that can lead to data corruption.

Fix this by comparing the group's address with its subsystem's su_group
and updating the safety contract of `get_group_data`.

Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
Cc: stable@vger.kernel.org
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 rust/kernel/configfs.rs | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index cd082b83e9e7..c5fdafde0107 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -295,7 +295,8 @@ unsafe fn container_of(group: *const bindings::config_group) -> *const Self {
 
 /// # Safety
 ///
-/// `this` must be a valid pointer.
+/// `this` must be a valid pointer to a group linked into a registered configfs
+/// subsystem. Its `cg_subsys` must be non-null and valid.
 ///
 /// If `this` does not represent the root group of a configfs subsystem,
 /// `this` must be a pointer to a `bindings::config_group` embedded in a
@@ -304,9 +305,15 @@ unsafe fn container_of(group: *const bindings::config_group) -> *const Self {
 /// Otherwise, `this` must be a pointer to a `bindings::config_group` that
 /// is embedded in a `bindings::configfs_subsystem` that is embedded in a
 /// `Subsystem<Parent>`.
+///
+/// The containing `Group<Parent>` or `Subsystem<Parent>` and its initialized
+/// `data` must remain valid for shared access for `'a`.
 unsafe fn get_group_data<'a, Parent>(this: *mut bindings::config_group) -> &'a Parent {
-    // SAFETY: `this` is a valid pointer.
-    let is_root = unsafe { (*this).cg_subsys.is_null() };
+    // SAFETY: `this` and its `cg_subsys` are valid by the function's safety requirements.
+    let is_root = unsafe {
+        let subsys = (*this).cg_subsys;
+        core::ptr::eq(this, &raw const (*subsys).su_group)
+    };
 
     if !is_root {
         // SAFETY: By C API contact,`this` was returned from a call to
-- 
2.34.1

