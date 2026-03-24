Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61730DEDD
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 20:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382573; cv=none; b=TW2M8E0T1CHsEBcDh+gxzy3+gwVXuFIs8b0bGpbSEKeamrrTjUFr/ajbh/nIMD/zMnz/GSaNAqErehz9buQGacQeA8KUfrsYZAkNpqh0RZFKjlwon2WoorMlM2yZeLskphyma7li+TRfoG6xuD5nHlIjIM31BNywXCnljf871lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382573; c=relaxed/simple;
	bh=9Q2BIJY9XGZIVPXCHLNkksj5N6VhYIDtkdiyYeFZrjc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h19FZ64d3acXO2k/yGEalwxoaAoKp6+V4u4FMadYN00JG3E0c9U6lqh44Nv7Z4OIcYDo9IrN2aKpdlwnE2C90L6t5+BtuIcKnZTrGstJXFurSj+hp0AhwUuVxMYtaiM0zTSM3meWNeZujJeAKhXc7DGcQm8/4yIpWTehQE8Ltxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C09tpgau; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C09tpgau"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8f848ebcbbso363747266b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774382569; x=1774987369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OO/LAjZIunen0Lhk2qpZmDx7MpLXKvlzJBeljL6KS7Y=;
        b=C09tpgaufmbMOTR6KfHN1u4Yd+JllvNrG3qIaoa73dj4QVwSGzYPYMWvMo1+cILwXw
         /EMwMiOZZ7a/VfTWRIuXnFg24N9eFHRSY+cDfnqlObmOo7aT9yjuLVZhDcE7EgV8VcFf
         KIin8sOFRH0c+OTel7rXGg067WTiGdgSdWMyzD6pZQ4ryYVinLI68s7p6IY3WisJR7nC
         hnzCP9aTgsB8Zbboh+bl6o5Zn2HljqNzvWYwkT4EvPKqJOEpXIE5NCqy1ZuSQurtm6/F
         luran7uYeEWL7C9TERoo03XHeVkwYO2+jYAPSwIN40W97NQ/j3rC1AtxoTVTXXJXUZia
         v8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382569; x=1774987369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OO/LAjZIunen0Lhk2qpZmDx7MpLXKvlzJBeljL6KS7Y=;
        b=RPhDE9472UGnzcFqwaifhacVe87DcI3eVgS4cpwWr/TyxH47UB4wT2ReUzYODP0C6A
         iw3s/IVIN471x7GSr4FcXv11Ttpjkel+bf0QXLJqJ8KF62aGA/i7VEjhzBxWEcx4leWn
         L+edj8XNOrx4pQpY6b33CiExXjmOcQcca615+li9WUZiNgiojTjX/6IA9MdbTnYJoCdz
         zk+aj0s9WoatWmorxSmvrVxy8GjndgKhsUavX2mraUUbKzQPh7EBjRYtMdPiHNuAAEuN
         3yHNcKogFLb5gKDnuFC4uoksUDLTNqZJC1HhvPOekTdPUWoz212EoEPVL2sPUbYNAwsK
         ABQg==
X-Gm-Message-State: AOJu0YzNLHzTmHlyrmKBJJRs8kZNjM2sJz6vimQtLFE8FzwRY9rUZ7TQ
	wCxiY/SNguoGUDOP3hsouQO6k0rP2yHCYmIkOeUKu26fmqYcC0UKKq8eMtxRk2b639ECFf6QHwj
	xFdK5mFEfRiYDqlzhhQ==
X-Received: from ejcbb10.prod.google.com ([2002:a17:907:a0a:b0:b8f:93d4:516f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7b84:b0:b98:b08:7459 with SMTP id a640c23a62f3a-b9a3f15ef7fmr62448866b.8.1774382568735;
 Tue, 24 Mar 2026 13:02:48 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:02:37 +0000
In-Reply-To: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9Q2BIJY9XGZIVPXCHLNkksj5N6VhYIDtkdiyYeFZrjc=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGnC7ePIFLQEsAVzQW/tuPtGIPuWg1Ojm74DJOfrcVIIk/a1i
 YkCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJpwu3jAAoJEARYvu5YxjlGuOQP/3rw
 8foueprmQay/sCrQ8do3+JDAR7+9FCobtk3t1TKgMJbxEt6HuCHkWeko/6SsSaKAqGfFnetLh0s
 lwVoXNRX+FX6a/zRX2nsnmftRIRJBAex9eLdYr2PktqS7rAjxVyUP+DNSj3IqX5C1QK88Hyl14D
 bpLoOy2yoqqjh7maYYukDApIK7cKF43yc+ERJs508l/BNmBRsklrcZoS9EKiqOjpRHN2PK3H0Bv
 nfP44z8xjw56TLhoHyTXqWAWeZH37gmANw/iCIhG8OCs0Go9NOklWC5wtsQk4mybRkpDeeRA+kr
 5TDLpb+sXT3l45x0u+lZJXGeQu2VKaTFsi/5BUHoJTX6tQC8C6jYcgkSD+hKU91HztNi82lFCOx
 /uaO6ef3IjPeLhmRd2QmJpFAraNPEjm8Q26Fi6IkwCrwzJmDtywlLFkjG+tombPD9UMzWH3uIiA
 r4Rt9jhn7PBrQypvbXYsYnB64Kt7bwoAVjqiS4DpMYZ8H2i4bPIySF/4nuqFGZT8UNj2QWuoU3W
 qkP276T4i+EIj81694UPIe/5WAbd+CW9Ke1R/Jf/T65TDu1/f/3+Qn0F2QqDZJuP+rSpuOj4fKz
 itkXgtYtfszV/+UU6h2E0o2XIu3kYJUHRnHiZub/ZyHksIugIPhOGQPtMbRMyiJTLImINvGRD8A +4ECO
X-Mailer: b4 0.14.3
Message-ID: <20260324-close-fd-check-current-v3-3-b94274bedac7@google.com>
Subject: [PATCH v3 3/4] rust_binder: make use of == for Task
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Now that we have implemented the == operator for Task, replace the two
raw pointer comparisons in Binder with the == operator.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 41de5593197c..b78c1490e654 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -681,7 +681,7 @@ pub(crate) fn get_work_or_register<'a>(
     fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
         let id = {
             let current = kernel::current!();
-            if !core::ptr::eq(current.group_leader(), &*self.task) {
+            if self.task != current.group_leader() {
                 pr_err!("get_current_thread was called from the wrong process.");
                 return Err(EINVAL);
             }
@@ -1669,7 +1669,7 @@ pub(crate) fn mmap(
         vma: &mm::virt::VmaNew,
     ) -> Result {
         // We don't allow mmap to be used in a different process.
-        if !core::ptr::eq(kernel::current!().group_leader(), &*this.task) {
+        if this.task != kernel::current!().group_leader() {
             return Err(EINVAL);
         }
         if vma.start() == 0 {

-- 
2.53.0.1018.g2bb0e51243-goog

