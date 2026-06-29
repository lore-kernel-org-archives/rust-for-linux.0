Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124C36C588
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 23:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782777158; cv=none; b=WikD56SYMB9hllOzQrOKIMRdb+CeNhB/k/bOa5pPAV3nsi8EGnms82YtSz5MOZzw/XJtnjRodpEkzKxzHsMk86wAcF1MG9IocjUajVWQOkI2QfyMDxezQVV3ljMp0/7lDcdDD9POw9Vrgg7Km9bUod4GvC+6+YxbM9DgZ9ewoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782777158; c=relaxed/simple;
	bh=feudQABQuU0/fmNADDVxeeZApshwMscW0TSQDYptN5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fE570OHH9L4SpOjJNV0N4UtMq2UcJRia9Z3kLDIWbIOk0/JTjZc/plxq1IgTteqoqgbbRR25A/OGvJaSUKf6tJZeGrdAZQU3iY/U+hopbcGgPwGOZ9XRAOm59lzPczajt+uepzldgSyRbR6gaQWn+y41U8k9u9gEO8ljcsn4I5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=DwvInYZq; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="DwvInYZq"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30edfd9cff9so692772eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 16:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1782777156; x=1783381956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YC5BbqfZD8YGX643DL4mtl51GwLRuK4PPQjYJTezTMk=;
        b=DwvInYZqHpy1VnUfgu1x+hrzEGZEn7yFdCn71NQEvc+C5TTuN0n8wyk7LIJ1RgQEIw
         sfTUwVIdCafadf4fqYtaJebqtatb6SweuMElP4t33XzlioWMAjigTC/O1EJdvniAveWr
         N1QKzXDwWlB/W+R1PJXbMFHcHmS/c4P32zbYKz8Wl7fPeiC6ANC/WUytPD51SdlB7CH6
         qt87JrZX40NgxJD7hwezMQ2wMTUJszd7CKSBXSBqy+/NfghfXMHiC1MqPd6cspYajMbv
         vUUmJgwQ8IITvqplxfyUSfoUgqkmCg6+AoFrk1TheSm8bLjKDW8vEEjnrYjHn2CZqFc0
         IvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782777156; x=1783381956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YC5BbqfZD8YGX643DL4mtl51GwLRuK4PPQjYJTezTMk=;
        b=gIT5k57feIfsZ7K6Hi1y88gPSYL9ka7FEktYXfLO2c4qKsnB0HC+/05NDGnvscJR32
         l2EWSme4NOKm+uNgZyTCG+zk/gAnK2iCMD9B7kA1+YIRTNKmqi96GTh4SS1MIjYrGsct
         B22nbCbiAk4fzdpI8EJAc46Kqg92pUM3cXE1CgC/nvt4lAf5TO/Yu/CCJNTa7RjVKPZe
         ljZjATZ9pvuGE5f3MPIZ2SzUrTZA5Q4iEhgP4FMYlHSdmeajFhhbtWYIgjetPhloBNHG
         aAdARlpndMc4n1WXfRvPfzgvt03GxK4HeiY4IE3nnNaIygcjJjdQ+Z6g6NC8tmlON9Ym
         2wlg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5FVGzHoPy/5okitCHZV5V5xHYWYPY2pIA7GQptBhgX8BNYZO2zuxTZjiHrQtHD04H/qCSSa1pCXZ2NGtFbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt2J8mx+f+obMeAX8kkwWlUzMiFDJrGuM8sCwRVMweDs6ROvCl
	Y2t07h0fygBqj7FW545HdXX5qOZ15JmB9nK46ZbPxyk8hdFuXPyNMVBbNJqEAClg56g=
X-Gm-Gg: AfdE7clJja8b4kUd5ld6JRMjqwc0E79w8OZhTwqLKxOBDDR6J1aVAWrYcClEVyZF5UJ
	M9quED0xd3Kzsnz4ElL55ymJPCxZRP/nvrYFvud+5lxYIOo2AlK20WrBwrrbo61VNraEMdG9C6f
	wrtEe67j9CdhjBoRBoytYEQHtRt3qWPJAgQdBCiC128pgu1HW6fkUSnxDsnoE+b9jIiZryFcHG+
	HdGSNZkqHXN4nIUzE6gyGOdvDS3VHfPwp4SdNX3H5QvLp5z6SNWctaoapWHbT4B5QC1KnsqfiXP
	pN4DIH1OiFRfP+2MBAJFFwZCw2ak95jTY8f4TlQae6R/wXkwnvcejxz2x/2GmUaNQpGw+q872D/
	YciCq0Ve22/hZ36/niDMx+yFRfECzkuPMDA3cQQGdpfqaHFT+uUBnTifMt03MGGOHUeIZhlKfPw
	dUzcLxyUQnSjalzuON+NlzLg+qhyEq6uVxRxnDVAySBdLWpvXsHCX001U3yPXJ
X-Received: by 2002:a05:7300:5bab:b0:30a:e530:ebc6 with SMTP id 5a478bee46e88-30ee12f0e92mr883190eec.12.1782777156502;
        Mon, 29 Jun 2026 16:52:36 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30ee326c7a7sm1707486eec.29.2026.06.29.16.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 16:52:36 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: ojeda@kernel.org,
	gary@garyguo.net,
	rust-for-linux@vger.kernel.org
Cc: peterz@infradead.org,
	zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	yuantan098@gmail.com
Subject: [PATCH v2 1/1] Make Guard::lock_ref unavailable if Lock is not Sync
Date: Mon, 29 Jun 2026 23:52:34 +0000
Message-Id: <878cfb22ab185874bc363e2b7910a6978af646ab.1782763889.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1782763889.git.pgovind2@uci.edu>
References: <cover.1782763889.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guard::lock_ref() returns a reference to the Lock stored in the Guard. 
Guard is Sync if T is Sync. However, Lock is Sync only if T is Send. 
This means that a reference to Guard can be sent across threads and 
multiple threads can acquire a reference to the Lock, 
even if Lock is not Sync. 

The following scenario is possible:
If T is sync but not send, 
Thread A: Creates a Lock<T>. Because T is not Send, Lock<T> is not Sync. 
It cannot be shared with other threads. 
Locks the mutex and gets a Guard<T>. 
Since T is Sync, code says Guard<T> is Sync. 
Thread A can now safely give a &Guard<T> to Thread B.
Thread B: calls guard.lock_ref(). This returns a &'a Lock<T>.
Thread B now has a reference to the Lock. In this case, 
even after Thread A drops the guard, Thread B still has that &Lock. 
Thread B can now call lock.lock() and get a &mut T.
This is unsound.

Fix this issue by adding a trait bound to Guard::lock_ref so that 
this method is available only when Lock<T, B> implements Sync. 
This ensures that multiple threads cannot acquire a reference 
to the Lock if it is not Sync.

Fixes: 8f65291dae0e ("rust: sync: Add accessor for the lock behind a given guard")
Cc: stable@vger.kernel.org
Reported-by: Dylan Zueck<dzueck@uci.edu>
Reported-by: Yuan Tan<ytan089@ucr.edu>
Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
Assisted-by: ChatGPT:gpt-5.4
---
changes in v2:
- Add a trait bound only to the Guard::lock_ref() method. Changes to the lock lifetime are not necessary.

Link: https://lore.kernel.org/all/20260605022400.31489-1-kentertan12138@outlook.com/#t

 rust/kernel/sync/lock.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..91317d0d81b9 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -234,7 +234,10 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
     /// // `g` originates from `l`.
     /// assert_held(&g, &l);
     /// ```
-    pub fn lock_ref(&self) -> &'a Lock<T, B> {
+    pub fn lock_ref(&self) -> &'a Lock<T, B>
+    where
+        Lock<T, B>: Sync,
+    {
         self.lock
     }
 
-- 
2.34.1

