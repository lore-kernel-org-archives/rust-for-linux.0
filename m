Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C9C410D17
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204014; cv=none; b=rxks6zoqS6Aats/COUtxOIw18O3c9wZu4bem+hx5EpsM0vRDGUAiHABWvL60YSokVICwu/vNX9ESBMNz8/9LVQoi9dpLKQw3nlT8Xl6M9eGezuzA41Qni13dGfz3bEhBz8yUJ314w7qyjiBluM8v+EkIjuCSnIDQvLz0Ak/XGEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204014; c=relaxed/simple;
	bh=REJXHD8fbxWLkRYodPOjTlLG7wUtH3QXKgE0W+Go6HA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Zm1+TQyb+i4zAtI9JHq5DvlhutYmmsnXiSCYQvxClDlW1lFcFplL0lhtnmY+PQ2Cgy2orBHbi0ytCwJ0djUD5hhrnpsK11pF8Ucsub3uG+w6mcWWP4MKRzA5+W9cLCG3j6uqpob+74E/eoblkTVSxNR0V4avd5fdp3/qd0+/mhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FOtcFmu0; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FOtcFmu0"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b936bda5ff3so153422066b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 06:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772204011; x=1772808811; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J2k3DOMY9k3W8meWU1kjLtGmphyC+1lYcSe1PPIXuVo=;
        b=FOtcFmu0ETaN3LL8vkMyIQALH+9Lehke4bjf82ns1Mm0CGJu3DRPVgDlSedkpFXTM4
         d5AjReQeYsPLvHdIi7p7JQ9m8n7suTg96AezJH3JszihTc8dmblTe0cLSedcnLeEtRuV
         FZ+KPCAY8AiEgQY6Pm2EpxZbtNHGonjceBVvxjtAXsURSErjW6Q0yHQP3DrY+zMJVqqB
         EkUfAU6wQ0mEpBomPkKMD9nPMhggvRO964O/OMLFUyQogcBTzwOAZKaoGpHcNvdjYg2q
         1egyRP3fBGAcIOfsBoOa47/turb8AkGGD3EcGfEdu4Uj55QZ4uyfLLDMCk6QVDb6OzwE
         uiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204011; x=1772808811;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J2k3DOMY9k3W8meWU1kjLtGmphyC+1lYcSe1PPIXuVo=;
        b=aOZBTt0p8juD798hOoQPJk/xZ3hZuvdyKAICMQUmYGgRLMLR/96pxvm7UJkFicM+0M
         jFBcug54g7qPR6RHD6NcT6FOafXN6xRsANRl60MaXuj5pdmRfn0Bg5wJ2QCFFSAbKDOA
         54G/iNPLI8KgZ4rOXesKPSLYjdxfLYrmN9zPwGKndbiPcAZ+IHJjLTZdYTWCjFgpFIl5
         s1GB8jJtt0kITp2XqgQQkhlP/2QM9YZTt0UnnDhD7L68TBJCvZ4aMFWhKHRq+nmirDpl
         Q8PwSGekSPmVcqOO4fuNJvKyjew8r8mHJJ1IwHVKbtl/fcYsyDVzWOlroStUqSDHL8Dk
         RomA==
X-Forwarded-Encrypted: i=1; AJvYcCWkMDRg8zV2EaCgOz0OAjPRYQ8G0MIk0aTcQMUjZ/Z1xwPcgYMOtSzedryv2BdTORwO3kx4FxMGlAf+YPL8+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRBzf/JpA3xRKUV4O/aXaWFOQOIh/N+k7hxAtDXla+oOlFT0g
	csniwOuNfJebPsiczmEtzmBVNvnkq4+CEjJXTkl7aYYZ9iNfM+TRAutTbDbj9snkdT8LFyoGDGK
	GuVrdnCApjHkJXNUozg==
X-Received: from ejux16.prod.google.com ([2002:a17:906:4a90:b0:b90:1d93:58e5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7247:b0:b8e:3d49:25db with SMTP id a640c23a62f3a-b937659a34fmr207751366b.54.1772204010619;
 Fri, 27 Feb 2026 06:53:30 -0800 (PST)
Date: Fri, 27 Feb 2026 14:53:19 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN+voWkC/33PQQrCMBAF0KtI1kYyaUOqK+8hLpp00ga1sUkbl
 dK7m1YRBHH5B+bNn5EE9BYD2a1G4jHaYF2bQrZeEd2UbY3UVikTzrhgOQDVHsse6c35UzfggLR
 iIgNRaFnmiqS1q0dj7wt5OKbc2NA7/1guRJinf7AIFKiRlUJpAJkw+9q5+owb7S5k1iL/CACQ/ RA4ZbRQueBSAmyV/hKmV0GP3ZBe7d8tp+kJWJ5iWQgBAAA=
X-Change-Id: 20250411-create-workqueue-d053158c7a4b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=REJXHD8fbxWLkRYodPOjTlLG7wUtH3QXKgE0W+Go6HA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpoa/kroJSMp+JXOjFFe2lS0vUVez2lSp9hfTj9
 359GP6d/0mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaaGv5AAKCRAEWL7uWMY5
 RhDHEACfCNXDN8CdbAyGFypT3+Eig1UwhapR/pUxPH7swml+HkWuevyEDiPdZGrP9EtOhbIZtk2
 Rl1gh6WBEdz819IIsAeKbo5GXY95T9UV7fONAQfoHSORO4E/thwoHoGaAM4KijCrtQQiyVThDCe
 uA8bDap7C/jXHnHKNjGAmLdkozFJv8BsMNkkyOj0a03atjIGhfVNy+PBQ3a2ISGaV4v0t1qcWfj
 4JaN4fJXnteUsaXl0fbk+jfZQm5GA4YqbxPvIC+Xd7L9VKzlkkG1pq88b642ig1dWdxUPwP03op
 Nk1py8rELAaX/v9Wvz0GJN+rbexxHDvfvfExvU8mj27nbC31gVKZ66Z0PkyFhJARWV2UY1W58LK
 UCc8+Cn+t1xm6/H8g1ERW2+eiuntdFsdMRoHwdX9KW+7j0V2HNH+exbyT8JUyPYo0rAVGeyocvs
 nyOKa6ShXiHTiMLTZwyEj1q5Ii201/IznHzk6plQK3vQxAaKwbXHYPcol/KV6WlTyWIS0ucc67u
 Hia/gGlp37NaaOfmzDgiP9Y59TiubT9IOmZFRk5mm0hOxWClSPUqwpTHS3HkwPiCF5/Bg6gFqw5
 S5rPDbDjo7KwI63/cnosP1W2AU1I+0zdOdz9FGfLo8RoY7/cwcCZuvehPD9/lmvCHohcN1aG94K /6hFKizTGdob8Cg==
X-Mailer: b4 0.14.3
Message-ID: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
Subject: [PATCH v3 0/2] Creation of workqueues in Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

GPU drivers often need to create their own workqueues for various
reasons. Add the ability to do so.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Switch to builder pattern.
- Drop BH workqueues for now.
- Mark delayed wq change as fix.
- Link to v2: https://lore.kernel.org/r/20251113-create-workqueue-v2-0-8b45277119bc@google.com

Changes in v2:
- Redo how flagging works.
- Restrict delayed work to not be usable on custom workqueues.
- Link to v1: https://lore.kernel.org/r/20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com

---
Alice Ryhl (2):
      rust: workqueue: restrict delayed work to global wqs
      rust: workqueue: add creation of workqueues

 rust/helpers/workqueue.c |   7 ++
 rust/kernel/workqueue.rs | 199 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 202 insertions(+), 4 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250411-create-workqueue-d053158c7a4b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

