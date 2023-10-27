Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1ABA50
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Oct 2023 11:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioxs3arB"
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0802E9C
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Oct 2023 04:38:17 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6cd09f51fe0so1050813a34.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Oct 2023 04:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698406696; x=1699011496; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e6mlpirKcTFiHw+bhQw2Vb9+Weax8IHEhYJnZrgyywk=;
        b=ioxs3arBNkEmPFbaG9lys6QmASqjw0v6sIaUDDwjSfZkYEbbvGqoW4weA4q+VEfdHS
         LV3UruZsp6osE4FsuNsNMSJ5h0qgsojJFPuJyvHChYAq2vi0Sc7aWT+f+ItCTWpUxtev
         ZVxwPjSX9cwwmugxh+BX2AzfJgCMvRUQQ5yEPEu69EcWDvTe+A32sc8qOfii20t0FLcI
         5R+1S5DCiZILFsLBqEhXMf8I5pFK39ObsM8rjzC2Gb7p4CJ+2cqahV256+4bl6UWw+Ix
         9oIbVQ2CVtqj01Farnxc/qmfHwkBkuu5b1iaIlH/7y8O5MVduJx8WuPQ4LIVrqH040G/
         CjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698406696; x=1699011496;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6mlpirKcTFiHw+bhQw2Vb9+Weax8IHEhYJnZrgyywk=;
        b=ORNITu8WfDiPEdPNtTcelnRfP6IpZNYibNrpWebzvV1KZ6Eg6WoYz8mjtbZkz6F03k
         W+r00/EW8bdDdATRDVhgolj8FzYJY0jWoOLlhP1fVIMTV9JXOUE7LDpjW54NV9nQISjN
         kBwguy/F9QAwqI58aofc+GV4LXSgK+9SeQoyGbt4hFfT4XPGwOgs8BR9Sn3QDqqV2Djg
         mCE7TJkJNHxajQe+EdUp+CdDYq3en66vatCAuYr2ibsgWMy7ExWTPY0czMw6u0zL5kLy
         HzktO6VvsmhuJLL68/zIg2AScI/0exJB/NyCMyYPI57QDpR3Eh/SAXQMwqaKeAqHO+qN
         Hbtg==
X-Gm-Message-State: AOJu0YzEFIdrBQjNlfQRXjePYlqVjhj7gtJtIfsJaO6eFeg0L2UDh50/
	jtUR1vsblj4Dta8fZGPN8JvKW7LXCwAEFJV33uAU4z6x1wc1wA==
X-Google-Smtp-Source: AGHT+IGS2lT0J7BmlykY45b3hSRBSI8Ze//KnjH46XVq989jwanJVZn/Ikk2O/MZ8EfAwvU/LpP7525igrww3CZzHRs=
X-Received: by 2002:a05:6870:d890:b0:1e9:e923:9520 with SMTP id
 oe16-20020a056870d89000b001e9e9239520mr3094249oac.11.1698406696242; Fri, 27
 Oct 2023 04:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Oct 2023 13:38:05 +0200
Message-ID: <CANiq72=3Uve5ZcbZdZDryz_iwSyc9E3j_-fWDnxUYa2mT56GSw@mail.gmail.com>
Subject: Trimming and quoting
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

When sending emails to the ML, please remember to trim your replies
(including when sending tags only). It makes it easier to read the
threads in Lore and in clients that do not automatically hide the
quotes.

Please see https://subspace.kernel.org/etiquette.html.

Thanks!

Cheers,
Miguel
