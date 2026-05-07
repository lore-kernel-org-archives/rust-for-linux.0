Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7453C7E1E
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147318; cv=none; b=dAxuVhQFaj7mZpEMYptkgufBglSBaiTDTzJdXpCJmElvb1usEWgQ/Kp9FGl0nqPu/tYW1YjbyZq/yZPQNQ4XSk/QAXo7400t04Gz0e4SC8CVcOjY/1IXc1p7Ju6pcDeFtWcAkm40HpwGiNIxIOM18i+SvOmrGVASfBYDZUtUhwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147318; c=relaxed/simple;
	bh=zv4CRjMxG6cW6KI/xOU888dvIo0Dk/ZlhGhAZbIM0UU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oBj0VHj1xJlRndFsUYqCeTzbPU6Bek0P5kUAHZZfAzxg06mt5DTt73EV+5OIBzM9fLC0DfTmeYkwrb9Dgh+oaRp8+Bkwe7dEbYYE2UmZEVUeLoAQvuHSFWcEalQwn4lM8/aDJxbRsPpffp0Klt0jr6ZGGzNX/Y4hgUXgaY+brx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sZoMdrqF; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sZoMdrqF"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ba5520bee9dso62403366b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778147312; x=1778752112; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/5/sJ521HSqpx+LKygyBE1/z0Tq4GNP4hZm84SNxKc4=;
        b=sZoMdrqF/q+mPwH8NhE9dn5IEFZdu5VbU2E++Xdj4adBU7BKZL4S8cyH0cDJCmUwZy
         ZGRgKHLaG/n4Yn5WU3+iWlpQokD0aXht54p8pWKNgHHwVq/mcKTc5Os4tcEFkZuTtFO5
         Gxd4NaMqXc+YlpAkehUQ09LtLC12/wjSUNLfOgL/+5BPuHuOzY2j9BpjwZnHFKNoh/lx
         ufQgwWyS8TEoLZJl4tmBluOFTlkYMXiepSdB9S9S0iodYMaSrv4k1JRsdvz6UGtV8lAc
         YBKohFAI0eVCrso0tpHuOnhhMMU5MU9A1AKql2M95QWw2pGdRHBVCotTTLoGQooABTuq
         ct4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147312; x=1778752112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5/sJ521HSqpx+LKygyBE1/z0Tq4GNP4hZm84SNxKc4=;
        b=TgyooO6hRQD0M4CXHR9l/mSAl8jHeltDmJHxChlsuekEGazQiAOHYMbSycBws5Mq6s
         Q8Nr3cK+T1D85aLMEt44oBsSBjEsnIEzSbrdzhHAzYdBC1Cu+UyGz23rn8z6sY+VVbUL
         8TNALXbUi2mv7/udH0b6A2953nacBEmnNIhCpbUTnuQKTnCzJkUFLKQCigtb13m5rUkY
         Yx3/9bzHuVgE5+83ITLnv+wfeAgFSLOfYh+hXEDT2JiLa4F5eKXe8Ns4jZ+3omZZzZ4K
         EOsQCbp2iVtJKKI53j9gR60QgX2zVwPPg38dTN8VyqYJLE75Kkm7HpetzO0+xYTlIRey
         UZJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9i65JV4dtepUSjJhnTcBHXdDZgrj/LoovaEy803mabqMoxnP1qarLWnlHd+XT0m/jSYOFbfbtV0Eon2Wd4+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdY98i+vEOyjbXzKJ7PcIYHJzDKoZEzifTCGtxW0Iv8xzr8a9p
	igPkbX8cnrIR9m+azExwA0AyiX1bJbfN/eHBIj6uR7fk9lMjE6slr4EiZqg/cVkJ/iioTGLCIZ9
	+eZT3ZTgHee4EMGqWfQ==
X-Received: from ejcgs39.prod.google.com ([2002:a17:907:2d27:b0:ba8:5b1a:e956])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e148:20b0:bc6:1531:49f9 with SMTP id a640c23a62f3a-bc6153157a1mr253846766b.45.1778147311343;
 Thu, 07 May 2026 02:48:31 -0700 (PDT)
Date: Thu, 07 May 2026 09:48:21 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOVf/GkC/33NQQ6CMBQE0KuQrq35/ZJCXXkP46KFLzSK1RYaD
 eHuFlyoiXE5k8ybkQXylgLbZiPzFG2w7pLCZpWxqtWXhritU2YIKAGF4p46F4n3Opw4DbbmQlF
 uAAyRIZZmV09He1/I/eGVPd2GJPfvsrWhd/6x3EYxt38eouCCK8hBQomSoNg1zjVnWleuY7MW8 UPA4oeAs6BVVYIukYz8EqZpegJx6cKUCAEAAA==
X-Change-Id: 20260219-remove-task-euid-19e4b00beebe
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=zv4CRjMxG6cW6KI/xOU888dvIo0Dk/ZlhGhAZbIM0UU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp/F/pnv83zBt9u5iZhQPRTnp/ebl3127sNpbm3
 5exxhC2SqGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCafxf6QAKCRAEWL7uWMY5
 RgrxD/9JYGfzyTRaAucYzVs7UVsHG01MfJneX1ArtBW+XfdgCTMv1TaotjLvX3f9oWrjHSK81y1
 e2LGHh+qVfi3MhrZKdNAjbsR0egqFdO4DBTVC9eQC2DJk3SmnBD5SSiRJP0r3jvPLKs4UqY7vsv
 ylVhu2QnyaDhW85OpC8QZVL19i7mN3yDr1qtoEkWvLpZSIMNOSns725K4dZUCEDoP5Aq4IgU2An
 VAZ3zHW6W0H8JtMfrMxya5KnOgf/w3qfZtzoqLSluCFs8TvKNgNapH6vfdcOFE+OMZq3l4mfT/J
 w7mkMvxlI8bBYRP1QOeWNyH7a3gijntW++miYHC6tP8tM7qR3MFx3g+NlP70IP+BD7ipqpR2HIh
 sq/D2zRS+cSsQ2Zs1vf/VeSYtyL9UZvyokb1gb7JpP9Zxe0eo3viJeOeS6XZi0yPB4cwyrUoI4E
 nkW/WnQ5EftFckjHDmxVSfcy7m2IGtgwYSRF5zSUaMaAVQxHg+M2EU3DDhCL79lSiGjT8zhzu2h
 Noogag6lnWz7K0uIYkMcMUAlhFfO7GObmjpeIb+51m6NpeREruXmhNkB6ud8N6tGjYxxjzidONW
 grvS1CGsZaMaIcru4P+FCglOLQ4YNnqmCgn/cJ8fm2qrTjvLhLaU41L60aBmdDuOCMhDCmRNkzG YWQXsbq20HIyXZA==
X-Mailer: b4 0.14.3
Message-ID: <20260507-remove-task-euid-v3-0-27f22f335c2c@google.com>
Subject: [PATCH v3 0/2] Delete task_euid()
From: Alice Ryhl <aliceryhl@google.com>
To: Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The task_euid() method is a very weird method, and Binder was the only
user. As of commit 65b672152289 ("binder: use current_euid() for
transaction sender identity") Binder doesn't use task_euid() anymore,
so we can delete this method.

My suggestion would be to merge this through the LSM tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Include 'task' clarification commit in series.
- Rebase and resend.
- Link to v2: https://lore.kernel.org/r/20260227-remove-task-euid-v2-1-9a9c80a82eb6@google.com

Changes in v2:
- Update translation as per Alex Shi.
- Pick up Reviewed-by Gary.
- Update commit title to use cred: prefix.
- Link to v1: https://lore.kernel.org/r/20260219-remove-task-euid-v1-1-904060826e07@google.com

---
Alice Ryhl (1):
      cred: delete task_euid()

Jann Horn (1):
      rust: task: clarify comments on task UID accessors

 Documentation/security/credentials.rst                    |  6 ++----
 Documentation/translations/zh_CN/security/credentials.rst |  4 +---
 include/linux/cred.h                                      |  1 -
 rust/helpers/task.c                                       |  5 -----
 rust/kernel/task.rs                                       | 11 ++---------
 5 files changed, 5 insertions(+), 22 deletions(-)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260219-remove-task-euid-19e4b00beebe

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

