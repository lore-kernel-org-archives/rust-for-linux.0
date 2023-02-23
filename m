Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340BEC61DA4
	for <rust-for-linux@archiver.kernel.org>; Thu, 23 Feb 2023 17:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjBWRxW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 23 Feb 2023 12:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjBWRxU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 23 Feb 2023 12:53:20 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7652FCF3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Feb 2023 09:53:19 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bp25so14894900lfb.0
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Feb 2023 09:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=drBE7jF+yHqxmm/1mpROjEpv+hFgiH++6nPEJcmwTjw=;
        b=ZnCCJL3G4VqPO0EnW6K6OhnBY+B7VanPU8V+zEnDTxdH3Ja8elJtHx5AdRJOcf82OT
         Ezg72LY7X1Q3t53fPXbvlE1q3TL+USNCmCvKpzPxiixU0u05RJU57ZQE9xz2PvMOOrWM
         Zu2qr0b2Lb2Dq4OLKiMZBiFzCE7xoCgGxYCMqzMrWIukySptxj3afPPI5KsYaTpIiWfg
         W0atvLQis43iE02WozUew+dNDtMF1G9oy0k+oQpade0/iD9YlmnGE56MfZe/Sb9EKd04
         lhzj4HdB6ReaYZAXYiIFvQ4oonxetayoV/kAGaaAA1iNXg9dcbZ4UDv7+0xIgM3Jd8VJ
         un8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drBE7jF+yHqxmm/1mpROjEpv+hFgiH++6nPEJcmwTjw=;
        b=ITOh0l11Q8KcoFzBNst9q8oW/MOIzYUsgL6Z79JlajA6AAkDX0w8GqnUPzU2pJ17+O
         FmRV7y9A+U+WLGelrwnysk0dnh0kK87SFN5Pxd4B5n1uY509+FOfcUh+WmCK+V7695S3
         9KyCxgvfB16M3cgyRe3Hk2hHVkRESy/PM6SihtrmFTokgZD50VhesBc3RHNxRuohkCyg
         FAj1mrP9OxcL3bUkJYgQcfXV5BkxYMylRYaj7oufGGXP6XUdKekT2+uJRwO/N7IskbXT
         yZTGz8nbK4+FIyjo4eVCuggat1mGUP6UKa8IXr6i1FYU6j1cYo37SYfIbbDWOXZxl3Sm
         0lbw==
X-Gm-Message-State: AO0yUKU9ve88xC4dtlrWBh8/UkGX4CsQTNnu2ZOMxdTSzLE4rydChbS1
        8DB2PzbWe2l4t5RYmq13KVxVIKf2uwzUn3tEznmpft6n
X-Google-Smtp-Source: AK7set9h+DtNdNTbTSjKkdIJ75nO4XdxL3ZLCDqRYKFsU6/K/RB2Nv2fmg2iIcXPNwcYCVHBiAMeIs386YgmC71I8DQ=
X-Received: by 2002:ac2:4f09:0:b0:4dd:9eb6:444e with SMTP id
 k9-20020ac24f09000000b004dd9eb6444emr2535142lfr.5.1677174796803; Thu, 23 Feb
 2023 09:53:16 -0800 (PST)
MIME-Version: 1.0
From:   Sarbojit Ganguly <onlyjazz.16180@gmail.com>
Date:   Thu, 23 Feb 2023 23:23:04 +0530
Message-ID: <CAJ-LC0V-FZEjwv-hc1mmuFDpGzv6JOU7rgGqDZ_LTtenoa3MKA@mail.gmail.com>
Subject: 
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

subscribe rust-for-linux
