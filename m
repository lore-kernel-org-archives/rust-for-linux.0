Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC712CDA5
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967237; cv=none; b=E2nC8/xr/hXCgrQjMYinxVc2FFOP+l9UVEr+IlXz7rRNKMHRh8A0T+ryZFpqWIMuPdRyE1WJPreYZQeD+2nfaLRSG+OEznE+BsZroQYeqS9+f8uKWBTs3ADMTCPU6LqDTEyReX13KPdpiVRnfzwXkmmDCjhNsOZEtBgNWnm4VaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967237; c=relaxed/simple;
	bh=ouDYb4z0quzd6s0gjClC2dgJ+PRYtkKnH6NTCTVOVVE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=l97dPQOp22WtLnnpEwYoXtKUwy4T8IluxvfhIwyLLaObOucP+rDConef/tcxE7n2Olrd39cMcAG+osbE4Pt+WhP3DUYqS97Se9RjdZFk8JuKDukXBoyYefGXs4B/LR5Myf895iv/FXXk4cNPUYKkX03K6q+faCgVl/6Ss5TTK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ze+mA7wp; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ze+mA7wp"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-426ff59a320so6045880f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760967234; x=1761572034; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=STzJosxuF8Zl//SOONm1dXPU4DAeuchiB158wmcdaho=;
        b=ze+mA7wpkKxLLc0+Cz00sMdenK19SMdSE3XgyJkuU+Y3f2Qz7NX9zi6U0MQAc+BO4F
         E1tjFa6x218c1QODw6fe6hz8OWETgDsuxQQCWpGwIaqyhbEez5aC5OVyEi7Xb8DXSW5g
         NqPuKCkVBp6LJ9ctecti5G61aw262JmTucPeLM2yMNWr2SR+tQZ7nl7LOCdYK1hkQyYg
         /gVYFJziUV9dQqCgpc39akvxR+fmo0jlW4pbogAE5rb5uI7WNMee1/y+u9qN83AGd5fX
         n4dxqmq306rdrOekSs/9y2tO/gUQCkNWv7UH/VGJUrQbNzPoRuATzp/vCj/AqrUZz5Q+
         j9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967234; x=1761572034;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STzJosxuF8Zl//SOONm1dXPU4DAeuchiB158wmcdaho=;
        b=qogR3I7tIyGXaOEBgrfdh2R+MW7w46zvp2eFkGPkmcCmwJ6Labge93M33YbWatdIYX
         ED4qucNWcy1YUvJIUg0wff6hxserKJ1knVh4sa8ZcAr5uPjiDrwUxzeT3xCB6iHzP97i
         SnFhRTosFFRop0S0AHChgUcBBG5UYl2LwflqmVgL6lEYfBwtGo7Eg0M9q1ayB6lkdEjy
         9OkqWOtbH7UQ8Qui1LpnE7VIRaQwFrf+DpWTIG2J5MjoNPGwaLVKjJWyv+1wouUePL8J
         BSEvS8CZCJ5nLvQor1K4DiP3QdkLAgULosFh3dtiEQB7nk8cs5Me9MqcpvNApTHnbTRO
         yTDw==
X-Forwarded-Encrypted: i=1; AJvYcCVEdiO4kcJHZVtDvf/bXDpDNpId82RMBYeREuOrwWiAVdIi3UOF+wr1prVl8NaVWyElsNU/t3/5OGwFIn6AmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsdQG7707kcp/wTMnd2MP680/ES84JUhZqHZgcD2Nz3InseRW
	Jd5oVnc+0PY4EitYM/HRxelbYfSrvg4lDRGRn36i+BSgHxOpZn6Z0J4a/MJbUCnAKFL4Bd5Bcys
	WlgKcpB/mk255D4FqrA==
X-Google-Smtp-Source: AGHT+IE+IW9ERh5o8DeQ6sz/SwHA1h6mSe3GOsxjOIcdSg9SQ5Q7GgiDlxH4Jbd8RAvI+yWcn/7ESg63K5FQto8=
X-Received: from wrpq11.prod.google.com ([2002:adf:f78b:0:b0:427:5e7:1e20])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c7:b0:427:847:9d59 with SMTP id ffacd0b85a97d-42708479e00mr8460355f8f.45.1760967234503;
 Mon, 20 Oct 2025 06:33:54 -0700 (PDT)
Date: Mon, 20 Oct 2025 13:33:40 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADQ69mgC/x2MQQqAIBAAvyJ7TlBBo74SHTTX2kMmGhGIf086D
 XOYqVAwExaYWYWMDxW6Yhc5MNgOG3fk5LuDEkpLIUbuKHrMHfdpE9fWCj8ZE5wM0JuUMdD7/5a 1tQ8gwrOvXwAAAA==
X-Change-Id: 20251007-binder-bitmap-5aa0d966fb1f
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=602; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ouDYb4z0quzd6s0gjClC2dgJ+PRYtkKnH6NTCTVOVVE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo9jo8awp2fL3+SfjSCaaA6fiOradKSF1P2u4P+
 5bt+IzbJlCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaPY6PAAKCRAEWL7uWMY5
 RjAxD/9gQB2TO0dD3bI0wgF2rZ2dRKTv8GgDY3lVCJnKi6dcF1JvDDUozIOuwJoHJnBQmlUXaiX
 eyVjqG9jgYWb58YgJSr5AqRSTanNEEkawKe7AJTadte8ijOmuhbkEbBjKPsoWaPMrEN0TNlBB8l
 7znSmF8BkJM5JkpEaI9HZhLW5F0JAXaoPf+JWREvzjnXE+MLi7A3uTN6DQA5QZuPuHOGp9Aj5jp
 NAihfCuE0iv3XF3zbjDUNTUwN/8Ct+SuyVncmzH61y0j9Y4XQJlVp2O43ewf5Xjh8dk7ndR8ftu
 OpKlTCWdaz+zRTvrVD5PynxqvtwM8sSMqtjgvn/Wis1QihLutDiwzV7garu6LDDjwA8J6g17whn
 0kI7v+uDnrFzKLghw8OlLgSsDwOz8t1WdhURe8pjz/8kkW16mzMcNk7+esiZo7AcALWd+De8XLv
 nTXtLr1Pg46bPPEi3O5Q30FK+dbzDRm0TaUoKHZdJH1b68wHlC97GZDwjK8At/v4pXvDvvYeJi9
 kSA7Cl1R5jD1JrNmW2Io/w5NPZamoDHVVGFPU73T+pBOAtC5vsMAS4Evn3V5vJJQawc35tbVyUJ
 zj++1GqWQvLLT0GKtdvQkaCv4JJ4TUi8sMhb2XWO7CaL0MdltWAUXvkk+sSyq/+4DmMwSUOWFRK uIVBkwZiz059fEg==
X-Mailer: b4 0.14.2
Message-ID: <20251020-binder-bitmap-v1-0-879bec9cddc1@google.com>
Subject: [PATCH 0/2] Use Rust Bitmap from Rust Binder driver
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

See commit message for rust binder commit for details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: bitmap: add MAX_LEN and NO_ALLOC_MAX_LEN constants
      rust_binder: use bitmap for allocation of handles

 drivers/android/binder/process.rs | 110 +++++++++++++++++++++++++++++++-------
 rust/kernel/bitmap.rs             |  16 ++++--
 2 files changed, 101 insertions(+), 25 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251007-binder-bitmap-5aa0d966fb1f

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

