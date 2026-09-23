Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187132C8B
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 20:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195521; cv=none; b=ZPk8zltcnTOpZwxVpY4McLqXkUmk0IPftQdID2uObkxSF1seGrCvOrprm4X9bwve8Bcu95KX5mTuwwt3zzbbv0fBF+uxiMQgu9izcyWq7mkY/ujp3N9mxwJIEOrCkc0KNgb54vAv/boxvP2N+1HuSLs0Hvwo5Ttp27FLkKI/5G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195521; c=relaxed/simple;
	bh=lsgiFQR0W1RaDSUCFb03bBzHp12jvBbMgfMT0EHXOU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R46CfA82asa9BnFHdo4Sp0pBXpFn72sed/2dT79G+Thnle5Gxvq5Z2VG9BFlQdARTClsLHc9ZZxSEiJOXygwqwS0r71mnwBlJDbhh7gtyW57gVh0dE4sWggTQ8/8XMoNkpmtpSD381HRrKTbXlY5gNy4sqiU72/mnfx0BfnfEBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=AMn7/2lS; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="AMn7/2lS"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664b7528so1073657eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1790195510; x=1790800310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVIQWAnKN98ur25hclWfvj2q8SoQe7T1V/QGgzzXRDE=;
        b=AMn7/2lSX5Th+yZGhRnGoLWYEdBNStTpDb54W4SBTUoGLe8qFhAChUFr2pj6okS52/
         b3acy/KC0FBjMCs7qWyKPAx/EgyrOSBcebaDbigWhVvXdCISQuaUysDFiaabfpPb2IK3
         /AE5VKI2hScqCzXvEJo//nS6ET6mb1MinCKM2Y+VqDXh6gASzr/h36aHwIePsmOk7pg6
         oTvIJc1wHcS3X+Oi25jKBF+HAQJQYeRuJSwyO9ndNBDiaKS+5DqLWm0hXJnZNLDwFFCd
         wKolQ64v6fvoRHiyCml/m9wLOThCijXFDAOVurzD+TZasjVlpyRNedjUlI6+ZMmBr35l
         h4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790195510; x=1790800310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVIQWAnKN98ur25hclWfvj2q8SoQe7T1V/QGgzzXRDE=;
        b=N7mPuOJy1ynovRhUg8/tUSYYC0vI4PSyHRDUvZkfxEdBE9JuGC5G3PQr01Ra7Qq9JQ
         Mz2UlS92NgbesA7go7LnWDwkCnB8XwGBYOGUeCVV6lTEp2FZjKdVbeSKYT9uBERlkPWh
         nMCvP+JZLOMWiRsiJrqBjzMFIHq/ZDB7WxkUWN1LXCOLbDdCiNNaEo6OCqi7nqs9s63o
         QcdADOVUifl+1TYQvBJAeOPQ9WtRmq5lsYV00bHt36fJaqgs/u2DHLDECDqFx4vA6XLJ
         xz8w+GwovT/9lZ709xnK3WkseqCF0XZ8cYV/++qeF1xxijBGlpSQ/2yy0JHWZUljs+Wo
         HOEQ==
X-Forwarded-Encrypted: i=1; AKwUvByY5NIxdHctOqMge+UwNLMfNYi6VdfaA9TKHGUDpLmz2Y/deA6V0q4oQtmTsYeRKwCikk+znWBFVORZ/V30Wg==@vger.kernel.org
X-Gm-Message-State: AFuF++kLS8ZXNyU9eiVkWHBmOIJQG0VgrNbzvnwOuGIw9LAcVRRVPhVf
	Um198Df7uOR3uM6VeZxOp2D1W1Yzy9w5mtF2mF6NUY2C/mo9ZxTBX6flbrNPCVF74V4=
X-Gm-Gg: AYBFou0/PqP6ebIbzVpAAqX0wpn6Eohp7OH59EGU3V2Qd9J49uQLF/ThKCKncmny1fA
	2dXtTkRQfzNLB3duBRRqwUKTNPnZSZ6opAwOq9ccT2gPDNsCvx9tnuKWSOydBkzwO1f+f7UKl1B
	flyvXTJ4XYMUyiCppsy+WnYV9QYDgFmtYu9pdHZUv4xTbbSxQhd8yTdsfvGyKCA5EBPf1QSFPzN
	HFJoydcpcDymIf1/MCk8/9Cwjt8SefekS0oNZ7Ct4cEfLYmmktAJtn3CysoKBW/gEMrlFa+6DRx
	O5N8JlxcrPCmpRvsJ3Tfj9+Q5yKUcWF2BS6zdToSEK02PS3igVJtN30IQA0RK+d9MA3hmiFJq0c
	a6i/WwaDhQR5VEvSQGZYWqEVw+4eYthr154P0lYSpaGAEceWD2mCVoTPYJsevb/di0+7ebOY40C
	wfe9lxKUdei+TDOptWWxQMIGThSaNUK/CIoUKUCyz6eu04JIJDemyxeyqTopqA16qqPBLIsgoET
	nH0oHyD3fqEr/06qB01JaQizxDUxQn+uxq8mlhI+uiaVg==
X-Received: by 2002:a05:701b:4512:20b0:143:297d:21f5 with SMTP id a92af1059eb24-14503fc5fedmr228574c88.34.1790195508236;
        Wed, 23 Sep 2026 13:31:48 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm13276486c88.7.2026.09.23.13.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:31:47 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	ojeda@kernel.org
Cc: atomlin@atomlin.com,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH v2] rust: module_param: Fix potentially incorrect access of `SetOnce<T>`
Date: Wed, 23 Sep 2026 20:31:45 +0000
Message-Id: <20260923203145.18714-1-pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1789426258.git.pgovind2@uci.edu>
References: <cover.1789426258.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `set_param` function casts `kernel_param.arg` to `*const SetOnce<T>`
But the Rust module macro in rust/macros/module.rs initializes `arg` with
`#param_name.as_void_ptr()`, and `#param_name` is a `ModuleParamAccess<T>`,
not a `SetOnce<T>`.

ModuleParamAccess<T> has default Rust layout but `set_param` accesses its
first field SetOnce<T> assuming it to be at offset 0. This is not
guaranteed by Rust and could cause type confusion leading to data
corruption.

Fix this by casting `kernel_param.arg` to `ModuleParamAccess<T>` and
then accessing the `value: SetOnce<T>` field.

Fixes: 0b08fc292842 ("rust: introduce module_param module")
Cc: stable@vger.kernel.org
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
Changes in v2:
 - Split unsafe block into two separate unsafe operations
 - Add safety comments explaining the unsafe operations

 rust/kernel/module_param.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index f9a14765a926..1a2fcbf4a5b3 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -74,8 +74,13 @@ pub trait ModuleParam: Sized + Copy {
     crate::error::from_result(|| {
         let new_value = T::try_from_param_arg(arg)?;
 
-        // SAFETY: By function safety requirements, this access is safe.
-        let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
+        // SAFETY: By function safety requirements, `param` is valid for read.
+        let arg = unsafe { (*param).__bindgen_anon_1.arg };
+        let param_access_ptr = arg.cast::<ModuleParamAccess<T>>();
+        // SAFETY: The `arg` field is initialized with a pointer to a `static ModuleAccessParam` by
+        // the rust module macro. Thus, the pointer is valid for use as a reference.
+        let param_access = unsafe { &*(param_access_ptr) };
+        let container = &param_access.value;
 
         container
             .populate(new_value)
-- 
2.34.1

