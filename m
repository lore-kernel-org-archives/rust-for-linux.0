Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24A17BA9;
	Sun, 18 Aug 2024 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723990121; cv=none; b=g74lXYcRrwoi4AA9xPXZLU2NUczQbOiPQFCkrGca2tlr08XCKhrL0h2Q669x+zJ3D4qwSo60hYqS1z7s9nbKIY2LB14ELBch6RQdzoiJ945GrvILQXRGWHOmm+PGTpdSBg+qFUT33VsiEzjSjsYsyV8zFWmUUTsEYVhtXsHQmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723990121; c=relaxed/simple;
	bh=9sFuh4ejMdxdXtCYfvXG+pVVZDVcD3PhuIlFpr8vrXI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CHrvVelHKKXBSKTQDS98YpQfwg2Q78R7qgWWzOmMMIkrSumrJXYCnCZBcIT1qfoyJxd4S1DMqB778FaWzwEnLvIGPISqROuG7OrX/6Ub07oCpM6pXntzQxq6vFl9x9gS1Zd7Ug6/LyyUVnFF0zrAS8Er8QubpLIhiLuxHpgc+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4Qy1TJm; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4Qy1TJm"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-76cb5b6b3e4so2408461a12.1;
        Sun, 18 Aug 2024 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723990119; x=1724594919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=laIiQJ2iEbIWT/0DgdSsdt92Z8C7p4+nGvu7hW2oc0M=;
        b=K4Qy1TJmQuc8qrd4ifoxnXrFPiaKzk527ITcB65yseQ1mfyxlzoV9LXL0k5/8upHqu
         9d90EtNSVoaabBQz09XX1rFAuvnTGcNyhSQBiiAGzB4eR4PUtALbEJ0Pd/2E34kZl8E1
         g0Q8t2ergJfLB923SAw4d66jA0gkNgZT8PBZUuCC0rDw/FvwyJHLHbVXkMWT0zhBqsnh
         /RQCxCvG+U72F1aLuCvtaCGpi61uWCzRkGUKUly1DoI0CbS/BG9h1e1eKwHzneubfz5c
         PAaZnZvO/h5AcXjX6H02OTlzrz7iyrahq0pWcuJY8nJZ7hyJiHU48ISnMXGS9ejyxlia
         RDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723990119; x=1724594919;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laIiQJ2iEbIWT/0DgdSsdt92Z8C7p4+nGvu7hW2oc0M=;
        b=DQThZgQFDgxjFGR90LiP3dPxPEkaUG5/S50P3GRLmxekm6nTVX6j84kG0u1M9nz1CR
         SwgQ7TuO4XPzFcg33sywJatI63HCBz2S+E/QrwRCoUB4PK5qQZpfBOq0Qgmc5UzgAMly
         qvswLbXFV4N0Wd25tImiqV49mxpQe/5gamcIC1C9zXSI/XooBvkVqDTknfgpcCwV8ZbI
         j/C0oaQT1bpgx/pe4pAl2XlHlCV7cW1E7zb+M8LMh48/42CJoOZCVlJGzm18WJBuGSDr
         5Em4+QSdw2H4a6yHTE/QVz+UjqEabOfhYipvqcoJ4B/VXTNY/OWv1zMmzo8m0xN9rzx0
         fkKw==
X-Gm-Message-State: AOJu0YyY46AK7ZXIKG6WAYRjVwaXm54NRYhSu1EjHmThrpG5WFO1airs
	GOPvPLT6Y+QohrX/Lu/H2/XsWs/PSWGK8KLrxZgHN64xr/2HE/2pgGKGIRRBaN4idru5uFSv3F3
	lvWP1s4L1bexpl52srbb0NU2XbunUGBjJDfA=
X-Google-Smtp-Source: AGHT+IEXuabBGklRqTMUQ4+dmxoZ4tgTUCIeZ3hzy18zBl5qcbZDb1bV+O3FYosnhtjaOS5/GApttsXR3FAHDy+7XZA=
X-Received: by 2002:a05:6a20:9f4b:b0:1c0:e1a5:9583 with SMTP id
 adf61e73a8af0-1c904f91247mr7436869637.17.1723990119000; Sun, 18 Aug 2024
 07:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Aug 2024 16:08:26 +0200
Message-ID: <CANiq72nSwGou23kFU9v8=CW_78WzVbCVhfDL=SNZja8aBLCRSQ@mail.gmail.com>
Subject: https://rust.docs.kernel.org is now available
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

The Rust code documentation (i.e. `rustdoc`-generated docs) is now available at:

    https://rust.docs.kernel.org

For linux-next, see:

    https://rust.docs.kernel.org/next/

There are also tags for each main release, e.g. for the current stable kernel:

    https://rust.docs.kernel.org/6.10/

The generation uses a particular kernel configuration, based on x86_64, which
may get tweaked over time. Older tags, and how they are generated, may also
change in the future. We may consider freezing them at some point, but for the
moment, please do not consider the content to be immutable.

Thanks Konstantin for the support setting it up!

Cheers,
Miguel
