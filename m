Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71B93B19CA
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383618; cv=none; b=qXYIDwxdUIE8gPG+C6nnLK4iKm92r0fjqXC+VJrpeITzFxQixh8ESQMXME85Fn6zbRmtEM2bi/zhMSDgOtJBORaZ++vKo2br1DK6yYuBkyLEu29/SP7DULYcJ6jL7WbkKom8j3hfqziyEh2Bqua83XmO0cL7UUPWpWv8kzAG9ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383618; c=relaxed/simple;
	bh=e+VgyD6SZLSBmSGzU3Bto41OTsHMD52dBjAauy1481k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MxIEZZ0R5Di1YBx6k+O/ysGFQicIo347ylxK8lGeru3ijq2LMr3ucL2t01wS20+4/Jj5AesCoH0EgC+PnGLD+ti+Ryx+LjrvP2+2gwhid402mT/YpyCDrnzGloE4lttniABzLvUxStSmoFy9/fUyF+jRNGyeYUM6o/cGgQ2E/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lqtEdxTG; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lqtEdxTG"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c427421f6so2783145f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383611; x=1791988411; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TOyKHfLc6kuyaXAU2rSomHrXK5rbC2R871XYjmy88o=;
        b=lqtEdxTGDzcyiKZDlgs7tQhnA/QxN3/6GrWuVRhrnUEb76jODPZfOGrhIzpp4eXXLx
         of8jIHYaeeRqo9Z3wex3z4cGfybRr9RyxQToALIktBqOkXq7zgsrKatAj2LM2zeVQ0c4
         489qRa5I+oPEyA2QqhjSIhdsLNIFscWw2h9JOnKk4m9xyJwkjYGcV/zpL7+Vqxkv2GAV
         RPzENSmIw7B9whEUBuNPgLx09EuqGwBZdPa0rm0u7tykAytIJvOVVm7H/ZAD7DR8dx7F
         bJxhXsmN7SjO3u9pBLUeKvBB2iTNYbLpAWZeSh45hG4Igde8OsWzeuEC+oj9bTWCx0rk
         8XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383611; x=1791988411;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TOyKHfLc6kuyaXAU2rSomHrXK5rbC2R871XYjmy88o=;
        b=h4Jdc6J/Lqh1PTjluROTEbPg5K3/Ox/BfCAE+HNdqOe6FHT/0Z726L11917VZp9L8D
         vgg7L6+mZiXSUQ3GvJJ7D+n8xhq8q3Ja13u/XnThMeQfq2fqLMtOwmKEKCeN8gHLGfKt
         5a85EVWdi5pBwo4W5JcVj2gaheSmjJNk77dPkRWcKHOhYzoEicUF++9Inhb6s/k6XKIP
         XHcV/Hz0iqG428DB7vbXqs5OyrIsROV0WYPoeDnHNTyDM0RwOSvI+LM2cmdTVGwqtaAi
         oP1vicHSkbytkXEbZUDyi3c0y517eGCjxJME2b40JOj8QmsYvyRPCmTWbO20DOcr/TE4
         112w==
X-Forwarded-Encrypted: i=1; AKwUvByWdLrwiXfAFHDCIusoNJ7cd1o+jnRZpVKWDRfO4GZxMr+n2/TMq+Tg64qkb3OYpHGCg5tMOq/eGFHjdF03zQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2APvf3nrCdYccAMZF2FY9zAGUy8wqfT+mP8lROhMckMmR1Blb
	Oet0FTfadtWf43hyFqiqhtQ+Hd5wJfma23T6dEArqUwqugnG2uTc0v8AA1E/xEb29RSxixAyH3I
	Jro5x7OAhh0l5Ydvw+Q==
X-Received: from wrbaz28.prod.google.com ([2002:adf:e19c:0:b0:48c:607d:f1e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:612:b0:48a:fbd2:c2b6 with SMTP id ffacd0b85a97d-48c728ab756mr4072442f8f.55.1791383610361;
 Wed, 07 Oct 2026 07:33:30 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:33:25 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADZYxmoC/x3MwQqDMAwA0F+RnBdo6timvzI8uDZugZFKUkQQ/
 31lx3d5BzibsMPYHWC8iUvRBrp0kD6zvhklN0MM8UYh3PElmtkwFfXylTxXxrorriZaHRPFnoj 5sVwHaMdqvMj+/5/Tef4AZhFLD28AAAA=
X-Change-Id: 20261007-binder-consolidate-txn-prints-c12311ee8f49
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=e+VgyD6SZLSBmSGzU3Bto41OTsHMD52dBjAauy1481k=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxlg47RNG2y3+qPIPORV9w+ffgXQgFfhQYtIyL
 w6m+8ER7k2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZYOAAKCRAEWL7uWMY5
 RmQmEAC5dLLwAjv468ldydHbUA+JwoOt27t+0kfWDQRYGyzcncAS3AgZQe8Q1MozW+Qtj6Z1+pr
 gPF+l7y0G0WBZZDi/ZgD7lNYefoUz5c6qakJU5ejdGxooHQC2geYTUfAU22nxKPMdCkFQDE9Ug/
 Z4b7ZyXBf7+0MbPgLuvbgrvo0wndbVFjQagksEL9Fu+yRPXr8H2B/5UTcycRc5rijqypMcezLoQ
 ZWQ4bkq4ZRWxCE4tvNoOvBaxXyuNzCbcZqJuqRy0jZiQfyFOdicBVaPkdBxEfvlI5L+9NHuh0qe
 OcPt2fCyjv4ckFDVcD0HBIjZEwGK4RNduOSIPrhYDShXwCkQOlpcQRzD/b3mPbgh2mjyTWTdvrr
 YpAr2roxkiH9YbZbSmX8RjbQQyJ8dxAN4xAj05q+Rkgv9WxzO/7SLAhyk20pyJxhSanGT2Rhm16
 0NxvgbHlTO9bhsV4BsZ9U2u6sT4ubmQ/KnY8FEcGTyCwoRPzMYQVuV1nkX44UotCmuta4J93XMg
 XosdmkgYmF64SV7hC6JgTm3jW15AY66hB5w0KPp2C9IQcSKVzqiIKb6zscOsZ22YBqTShaziYtk
 v7fyrwFI2b64cV4j2ocAhUZbNa+HDVpfy7LbWm8CW65C9i2lXnQ28uoMrziJZuSKu8LhRW/ojVE fDIGDjTJND5LK3g==
X-Mailer: b4 0.14.3
Message-ID: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
Subject: [PATCH 0/3] rust_binder: consolidate transaction failure prints
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series is split out from "Rate limited printing for Rust" [1] so it
can be routed through char-misc-next independently.

Patch 1 implements ZeroableOption for Error so that Option<Error> can be
stored in structs deriving Zeroable. Patch 2 updates TransactionInfo to
store Option<Error> instead of a raw i32 errno, and Patch 3 consolidates
the transaction failure prints into a single debug print.

Link: https://lore.kernel.org/r/20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com [1]

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (3):
      rust: error: implement ZeroableOption for Error
      rust_binder: store Option<Error> in TransactionInfo
      rust_binder: consolidate transaction failure prints

 drivers/android/binder/error.rs       |  4 --
 drivers/android/binder/thread.rs      | 78 +++++++++++++++--------------------
 drivers/android/binder/transaction.rs | 28 ++++---------
 rust/kernel/error.rs                  |  4 ++
 4 files changed, 47 insertions(+), 67 deletions(-)
---
base-commit: d47322a612daf8e97b2e5e4dbbabdff27080c1ec
change-id: 20261007-binder-consolidate-txn-prints-c12311ee8f49

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

